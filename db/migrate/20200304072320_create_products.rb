# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0] # rubocop:disable Style/Documentation
  def change # rubocop:disable Metrics/MethodLength
    create_table :products do |t|
      t.string :gtin
      t.string :gtin_encoding
      t.string :name
      t.string :brand_name
      t.jsonb :properties
      t.string :source
      t.timestamps

      t.index :gtin, unique: true
      t.index :name
      t.index :brand_name
      t.index :properties
    end
  end
end
