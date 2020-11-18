class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :crimes
  has_many :orders
  has_one_attached :photo
  validates :user_name, presence: true, uniqueness: true
  validates :rating, inclusion: { in: 0..5, message: "rating must be between 0 and 5" }
  # validates :alias, uniqueness: true
end
