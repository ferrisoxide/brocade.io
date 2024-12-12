# frozen_string_literal: true

json.gtin product.gtin
json.brand_name product.brand_name
json.name product.name
product.properties.each do |key, value|
  json.set! key, value
end
