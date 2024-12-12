# frozen_string_literal: true

class AddFullTextIndicesOnProducts < ActiveRecord::Migration[6.0] # rubocop:disable Style/Documentation
  COLUMNS = %w[properties name brand_name].freeze

  def up
    COLUMNS.each do |column|
      execute(
        <<~SQL.squish
          CREATE INDEX products_#{column}_full_text_index ON products
          USING gin (( to_tsvector('english', #{column}) ));
        SQL
      )
    end
  end

  def down
    COLUMNS.each do |column|
      execute "drop index products_#{column}_full_text_index"
    end
  end
end
