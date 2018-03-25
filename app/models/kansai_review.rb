class KansaiReview < ApplicationRecord
  belongs_to :user
  belongs_to :kansai
    
  validates :user_id, presence: true
  validates :kansai_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
