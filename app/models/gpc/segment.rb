class Gpc::Segment < ApplicationRecord
  has_many :families, class_name: "Gpc::Family", foreign_key: :gpc_segment_id 
end
