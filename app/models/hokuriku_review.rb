class HokurikuReview < ApplicationRecord
  belongs_to :user
  belongs_to :hokuriku
    
  validates :user_id, presence: true
  validates :hokuriku_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
