# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    trait :coffee_mate_light do
      gtin { '05000019845' }
      gtin_encoding { nil }
      name { 'Coffee Mate Light' }
      brand_name { 'Nestle' }
      properties do
        {
          'weight_g' => '450',
          'ingredients' => "Sugars,
          Hydrogenated palm kernel oil, Modified milk."
        }
      end
      source { 'openfoodfacts' }
      linked_data do
        {
          '@type' => 'gs1:FoodBeverageTobaccoProduct',
          '@context' => { 'gs1' => 'https://gs1.org/voc/' },
          'gs1:gtin' => '05000019845',
          'gs1:brand' => { '@type' => 'gs1:Organization', 'gs1:name' => 'Nestle' },
          'gs1:netWeight' => { 'gs1:value' => '450', 'gs1:unitCode' => 'GRM' },
          'gs1:netContent' => { 'gs1:unitCode' => 'C62' },
          'gs1:productName' => 'Coffee Mate Light',
          'gs1:ingredientStatement' => "Sugars,
          Hydrogenated palm kernel oil,
          Modified milk."
        }
      end
    end
  end
end
