class ShikokuReview < ApplicationRecord
  belongs_to :user
  belongs_to :shikoku
  
  validates :user_id, presence: true
  validates :shikoku_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
