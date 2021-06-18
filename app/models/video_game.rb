class VideoGame < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_title_plateform_category, against: {
    title: 'A',
    plateform: 'B',
    category: 'C'
  }, using: {
    tsearch: { prefix: true }
  }
end
