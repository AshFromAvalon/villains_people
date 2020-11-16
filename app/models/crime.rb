class Crime < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :price, presence: true
  validates :currency, presence: true
  CATEGORIES = ["Murder", "Mass Murder", "Destruction", "Illegal trade", "Thief", "Black Mailing", "Intimidation", "spell"]
  validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not a valid crime category" }
end
