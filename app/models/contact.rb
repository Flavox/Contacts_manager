class Contact < ApplicationRecord
  include PgSearch::Model
  has_one_attached :photo

  belongs_to :user
  has_many :contact_relations, dependent: :destroy
  has_many :relations, through: :contact_relations

  validates :first_name, presence: true

  pg_search_scope :search_by_name,
                  against: %i[first_name last_name phone_number address birthday],
                  ignoring: :accents,
                  using: {
                    tsearch: { prefix: true }
                  }
end
