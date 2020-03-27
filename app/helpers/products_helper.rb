module ProductsHelper
  def product_count(products)
    pluralize(@products.total_count, 'products')
  end

  def unit_for_property(key)
    Product::NUTRITION_FACTS_PROPERTIES.dig(key.to_sym, :unit) || ''
  end

  def title_for_property(key)
    Product::NUTRITION_FACTS_PROPERTIES.dig(key.to_sym, :title) || key.humanize
  end

  def type_for_property(key)
    Product::NUTRITION_FACTS_PROPERTIES.dig(key.to_sym, :type) || 'text'
  end

end
