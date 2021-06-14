class Tool < ApplicationRecord
  belongs_to :user,dependent: :destroy
  has_many_attached :photos
  validates :tool_name, presence: true
  validates :price, presence: true
  validates :tool_description, presence: true,length: {minimum:10}
end
