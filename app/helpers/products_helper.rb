module ProductsHelper
  def humanize_product_count(product_count)
    [
      number_with_delimiter(product_count),
      'products'.pluralize(product_count)
    ].join(' ')
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
