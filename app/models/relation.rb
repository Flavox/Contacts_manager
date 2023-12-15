class Relation < ApplicationRecord
  has_many :contact_relations, dependent: :destroy
  has_many :contacts, through: :contact_relations
end
