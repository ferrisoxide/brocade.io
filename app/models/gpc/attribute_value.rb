class Gpc::AttributeValue < ApplicationRecord
  has_many :brick_attribute_type_attribute_values, 
    class_name: 'Gpc::BrickAttributeTypeAttributeValue',
    foreign_key: :gpc_attribute_value_id

  has_many :atributes, through: :brick_attribute_type_attribute_values
  has_many :bricks, through: :brick_attribute_type_attribute_values
end
