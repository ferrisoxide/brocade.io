class Gpc::BrickAttributeTypeAttributeValue < ApplicationRecord
  belongs_to :brick, 
    class_name: 'Gpc::Brick', 
    foreign_key: :gpc_brick_id

  belongs_to :attribute_type, 
    class_name: 'Gpc::AttributeType', 
    foreign_key: :gpc_attribute_type_id
  
  belongs_to :attribute_value, 
    class_name: 'Gpc::AttributeValue', 
    foreign_key: :gpc_attribute_value_id,
    optional: true
end
