class OkinawaReview < ApplicationRecord
  belongs_to :user
  belongs_to :okinawa
  
  validates :user_id, presence: true
  validates :okinawa_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
