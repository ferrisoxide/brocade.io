FactoryBot.define do
  factory :gpc_brick_core_attribute_value, class: 'Gpc::BrickCoreAttributeValue' do
    gpc_brick { nil }
    gpc_attribute_value { nil }
  end
end
