class Relation < ApplicationRecord
  belongs_to :user
  has_many :contact_relations, dependent: :destroy
  has_many :contacts, through: :contact_relations
end
