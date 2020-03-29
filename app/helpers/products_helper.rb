module ProductsHelper
  def product_count(products)
    pluralize(@products.total_count, 'products')
  end

  def unit_for_property(key)
    PropertySet::ALL.dig(key.to_sym, :unit) || ''
  end

  def title_for_property(key)
    PropertySet::ALL.dig(key.to_sym, :title) || key.to_s.humanize
  end

  def type_for_property(key)
    PropertySet::ALL.dig(key.to_sym, :type) || 'text'
  end
end
