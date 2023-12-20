class Contact < ApplicationRecord
  belongs_to :user
  has_many :contact_relations, dependent: :destroy
  has_many :relations, through: :contact_relations

  has_one_attached :photo

  validates :first_name, presence: true
end
