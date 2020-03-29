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
    ingredients: { type: :text },
  }

  PUBLISHING_DETAILS = {
    author: { type: :text },
    format: { type: :text },
    publisher: { type: :text },
    pages: { type: :number }
  }

  ALL = NUTRITION_FACTS
    .merge(INGREDIENTS)
    .merge(PUBLISHING_DETAILS)
end
