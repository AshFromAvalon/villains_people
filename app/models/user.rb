class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :crimes
  has_many :orders
  has_one_attached :profile_pic
  has_one_attached :cover_pic
  validates :user_name, presence: true, uniqueness: true
end
