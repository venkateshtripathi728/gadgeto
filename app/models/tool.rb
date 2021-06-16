class Tool < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :tool_name, presence: true
  validates :price, presence: true
  validates :category, presence: true, inclusion: { in: %w(Gardening Painting Large\ Works Mechanics Plumbing Electricity),
            message: "%{value} is not a valid size" }
  validates :address, presence: true
  validates :tool_description, presence: true,length: {minimum:10}
  has_many :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
