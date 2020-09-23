class Feedback < ApplicationRecord
  validates :comments, presence: true
  validates :username, presence: true
  belongs_to :image
end
