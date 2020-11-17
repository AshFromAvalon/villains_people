class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :crimes
  has_many :orders
  validates :user_name, presence: true, uniqueness: true
  # validates :alias, uniqueness: true
end
