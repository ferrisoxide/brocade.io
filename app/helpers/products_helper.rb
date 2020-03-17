module ProductsHelper
  def product_count(products)
    pluralize(@products.total_count, 'products')
  end
end
