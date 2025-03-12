class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :character
  validates :start_date, presence: true, comparison: { greater_than: Date.today }
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
end
