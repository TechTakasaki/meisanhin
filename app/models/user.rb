class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :hokkaido_reviews
  has_many :touhoku_reviews
  has_many :kantou_reviews
  has_many :toukai_reviews
  has_many :hokuriku_reviews
  has_many :koushinetsu_reviews
  has_many :kansai_reviews
  has_many :sanyo_reviews
  has_many :sanin_reviews
  has_many :shikoku_reviews
  has_many :kyushu_reviews
  has_many :okinawa_reviews
end
