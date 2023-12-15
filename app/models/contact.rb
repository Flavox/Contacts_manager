class Contact < ApplicationRecord
  belongs_to :user
  has_many :contact_relations
  has_many :relations, through: :contact_relations
end
