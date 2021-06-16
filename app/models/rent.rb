class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :video_game
  validates :rent_start_at, presence: true
  validates :rent_end_at, presence: true
end
