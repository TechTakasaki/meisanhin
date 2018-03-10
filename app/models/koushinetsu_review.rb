class KoushinetsuReview < ApplicationRecord
  belongs_to :user
  belongs_to :koushinetsu
  
  validates :user_id, presence: true
  validates :koushinetsu_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
