class KyushuReview < ApplicationRecord
  belongs_to :user
  belongs_to :kyushu
  
  validates :user_id, presence: true
  validates :kyushu_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
