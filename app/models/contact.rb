class Contact < ApplicationRecord
  has_one_attached :photo

  belongs_to :user
  has_many :contact_relations, dependent: :destroy
  has_many :relations, through: :contact_relations

  validates :first_name, presence: true
end
