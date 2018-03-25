class ToukaiReview < ApplicationRecord
  belongs_to :user
  belongs_to :toukai
  
  validates :user_id, presence: true
  validates :toukai_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
