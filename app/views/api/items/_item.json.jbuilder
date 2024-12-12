# frozen_string_literal: true

json.gtin14 item.gtin
json.brand_name item.brand_name
json.name item.name
item.properties.each do |key, value|
  json.set! key, value
end
