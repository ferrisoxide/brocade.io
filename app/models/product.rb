class Product < ApplicationRecord
  # TODO add validations, etc

  def self.from_param(param)
    find_by_gtin!(param)
  end

  def to_param
    gtin
  end

  scope :full_text_search, ->(terms) {
    where([
      FULL_TEXT_SEARCH_SQL,
      { terms: map_search_terms(terms) }
    ])
  }

  # TODO Move title into en.yml
  NUTRITION_FACTS_PROPERTIES = {
    serving_size: { type: :text },
    servings_per_container: { type: :text },
    calories: { type: :number },
    calories_from_fat: { type: :number },
    fat: { unit: :g, type: :number, title: 'Total Fat' },
    saturated_fat: { unit: :g, type: :number },
    trans_fat: { unit: :g, type: :number },
    polyunsaturated_fat: { unit: :g, type: :number },
    monounsaturated_fat: { unit: :g, type: :number },
    cholesterol: { unit: :mg, type: :number },
    sodium: { unit: :mg, type: :number },
    potassium: { unit: :mg, type: :number },
    carbohydrate: { unit: :g, type: :number, title: 'Total Carbohydrate' },
    fiber: { unit: :g, type: :number, title: 'Dietary Fibre' },
    sugars: { unit: :g, type: :number },
    protein: { unit: :g, type: :number }
  }.freeze

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
      .map{ |term| "#{term}:*" }
      .join(' & ')
  end
end
