class SanyoReview < ApplicationRecord
  belongs_to :user
  belongs_to :sanyo
  
  validates :user_id, presence: true
  validates :sanyo_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
