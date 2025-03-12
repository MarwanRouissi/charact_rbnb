class Character < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :category, presence: true
  has_one_attached :photo
end
