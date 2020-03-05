require 'csv'

namespace :db do
  namespace :seed do
    desc "Loads datakick-sourced seed data from db/seeds/datakick"
    task datakick: :environment do
      filename = File.expand_path(
        'items.csv',
        File.join(Rails.root, 'db', 'seeds', 'datakick')
      )

      CSV.foreach(filename, headers: true) do |row|
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
