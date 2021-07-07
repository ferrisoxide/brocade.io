class Gpc::Family < ApplicationRecord
  belongs_to :segment, class_name: 'Gpc::Segment', foreign_key: :gpc_segment_id
  has_many :klasses, class_name: "Gpc::Klass", foreign_key: :gpc_family_id 
end
