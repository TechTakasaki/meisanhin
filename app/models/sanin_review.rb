class SaninReview < ApplicationRecord
  belongs_to :user
  belongs_to :sanin
  
  validates :user_id, presence: true
  validates :sanin_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
