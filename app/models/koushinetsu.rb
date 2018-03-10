class Koushinetsu < ApplicationRecord
  has_many :koushinetsu_reviews
  
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 300 }
  validates :image_url, presence: true
end
