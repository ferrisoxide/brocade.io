class Gpc::Klass < ApplicationRecord
  belongs_to :family, class_name: 'Gpc::Family', foreign_key: :gpc_family_id
  has_many :bricks, class_name: 'Gpc::Brick', foreign_key: :gpc_klass_id
end
