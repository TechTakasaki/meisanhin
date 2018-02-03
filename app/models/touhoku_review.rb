class TouhokuReview < ApplicationRecord
  belongs_to :user
  belongs_to :touhoku
    
  validates :user_id, presence: true
  validates :touhoku_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end