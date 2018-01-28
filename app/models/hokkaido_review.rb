class HokkaidoReview < ApplicationRecord
  belongs_to :user
  belongs_to :hokkaido
    
  validates :user_id, presence: true
  validates :hokkaido_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
