class Booking < ApplicationRecord
  belongs_to :tool
  belongs_to :user
  has_many :users, through: :tool
  validates :start_date, presence: true
  validates :end_date, presence: true
end

