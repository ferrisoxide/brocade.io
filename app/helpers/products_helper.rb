module ProductsHelper
  def humanize_product_count(product_count)
    [
      number_with_delimiter(product_count),
      'product'.pluralize(product_count)
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

  def link_to_property_set(title, target)
    link_to(
      title,
      nil,
      class: 'property-set-link ml-3 mt-3 inline-flex items-center rounded-md border border-transparent bg-orange-600 px-2 py-1 text-sm font-small text-white shadow-sm hover:bg-orange-700 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:ring-offset-2',
      data: { target: target }
    )
  end
end
