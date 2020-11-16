class Crime < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :price, presence: true
  validates :currency, presence: true
  validates :category, inclusion: { in: %w(small medium large), message: "%{value} is not a valid crime category" }
end
