# frozen_string_literal: true

module PropertySet
  NUTRITION_FACTS = {
    serving_size: { type: :text },
    servings_per_container: { type: :text },
    calories: { type: :number },
    fat_calories: { type: :number, title: 'Calories from Fat' },
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

  INGREDIENTS = {
    ingredients: { type: :text }
  }.freeze

  PUBLISHING_DETAILS = {
    author: { type: :text },
    format: { type: :text },
    publisher: { type: :text },
    pages: { type: :number }
  }.freeze

  PACK_DETAILS = {
    weight_g: { unit: :g, type: :number },
    weight_ounce: { unit: :oz, type: :number },
    volume_ml: { unit: :ml, type: :number },
    volume_fluid_ounce: { unit: :floz, type: :number },
    unit_count: { type: :number },
    alcohol_by_volume: { type: :number },
    alcohol_by_weight: { type: :number }
  }.freeze

  ALL = NUTRITION_FACTS
        .merge(INGREDIENTS)
        .merge(PUBLISHING_DETAILS)
        .merge(PACK_DETAILS)
end
