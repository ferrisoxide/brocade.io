# frozen_string_literal: true

class Product < ApplicationRecord
  has_paper_trail

  validates :gtin, presence: true, uniqueness: true
  validates :name, presence: true

  def self.from_param(param)
    by_gtin(param).first!
  end

  def to_param
    gtin
  end

  scope :full_text_search, lambda { |terms|
    where(
      [
        FULL_TEXT_SEARCH_SQL,
        { terms: map_search_terms(terms) }
      ]
    )
  }

  scope :by_gtin, lambda { |gtin|
    where(
      "gtin ~ '^(0)*#{digits_only(gtin)}$'"
    )
  }

  private

  FULL_TEXT_SEARCH_SQL = <<~SQL
    to_tsvector('english', products.properties) @@ to_tsquery(:terms)
    OR to_tsvector('english', products.name) @@ to_tsquery(:terms)
    OR to_tsvector('english', products.brand_name) @@ to_tsquery(:terms)
  SQL

  private_constant :FULL_TEXT_SEARCH_SQL

  def self.map_search_terms(terms)
    Array
      .wrap(terms)
      .map { |term| "#{term}:*" }
      .join(' & ')
  end

  def self.digits_only(string)
    string.delete("^0-9")
  end
end
