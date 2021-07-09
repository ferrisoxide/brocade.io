class Gpc::Brick < ApplicationRecord
  belongs_to :klass, class_name: 'Gpc::Klass', foreign_key: :gpc_klass_id

  has_many :brick_attribute_type_attribute_values, 
    class_name: 'Gpc::BrickAttributeTypeAttributeValue',
    foreign_key: :gpc_brick_id

  has_many :attributes_types, 
    through: :brick_attribute_type_attribute_values,
    source: :attribute_type
  
  has_many :attribute_values, 
    through: :brick_attribute_type_attribute_values,
    source: :attribute_value

end
