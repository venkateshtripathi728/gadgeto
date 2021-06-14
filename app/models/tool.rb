class Tool < ApplicationRecord
  belongs_to :user

  validates :tool_name, presence: true
  validates :price, presence: true
  validates :tool_description, presence: true, length: {minimum:10}
end
