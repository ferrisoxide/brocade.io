class Product < ApplicationRecord
  # TODO add validations, etc

  scope :full_text_search, ->(terms) {
    where([
      FULL_TEXT_SEARCH_SQL,
      { terms: Array.wrap(terms).join(' & ') }
    ])
  }

  private

  FULL_TEXT_SEARCH_SQL = <<~SQL
    to_tsvector('english', products.properties) @@ to_tsquery(:terms)
    OR to_tsvector('english', products.name) @@ to_tsquery(:terms)
    OR to_tsvector('english', products.brand_name) @@ to_tsquery(:terms)
  SQL

  private_constant :FULL_TEXT_SEARCH_SQL
end
