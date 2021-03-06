class KantouReview < ApplicationRecord
  belongs_to :user
  belongs_to :kantou
  
  validates :user_id, presence: true
  validates :kantou_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end