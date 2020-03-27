require 'csv'
require 'open-uri'
require 'fileutils'

def for_each_item
  filename = File.expand_path(
    'items.csv',
    File.join(Rails.root, 'db', 'seeds', 'datakick')
  )

  CSV.foreach(filename, headers: true) do |row|
    yield row
  end
end

namespace :datakick do

  namespace :download do
    desc "Download datakick-sourced images and store in db/seeds/datakick"
    task images: :environment do
      base_download_path = File.join(Rails.root, 'db', 'seeds', 'datakick', 'images')

      for_each_item do |row|
        if row['Images'].present?
          images = row['Images'].split(',').map(&:strip)
          gtin = row['GTIN-14']

          product_image_path = File.join(base_download_path, gtin)
          FileUtils.mkdir_p(product_image_path)

          images.each do |image|
            filename = File.join(
              product_image_path,
              image.match(/https:\/\/.*cloudfront.net\/(.*)/)[1]
            )

            if File.exists?(filename)
              puts "Skipping existing file '#{filename}'"
              next
            end

            puts "Downloading to '#{filename}'"

            begin
              open(image) do |download_file|

                File.open(filename, 'wb') do |file|
                  file.puts download_file.read
                end

              end
            rescue OpenURI::HTTPError => e
              puts "Cannot download from '#{image}'. Error: #{e.message}"
            end
          end
        end
      end
    end
  end

  namespace :db do
    desc "Loads datakick-sourced seed data from db/seeds/datakick"
    task seed: :environment do
      for_each_item do |row|
        properties = row
          .to_h
          .compact
          .except('GTIN-14', 'Name', 'Brand Name', 'Images')
          .transform_keys do |key|
            key
              .remove(/\s\((g|mg)\)\z/)
              .gsub(/\s/, '_')
              .downcase
              .to_sym
          end

        attributes = {
          gtin: row['GTIN-14'],
          gtin_encoding: :gtin_14,
          name: row['Name'],
          brand_name: row['Brand Name'],
          properties: properties,
          source: 'datakick',
          created_at: DateTime.now.utc,
          updated_at: DateTime.now.utc
        }

        Product.upsert(attributes, unique_by: :gtin )
      end
    end
  end
end
