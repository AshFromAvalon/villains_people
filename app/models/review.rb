class Review < ApplicationRecord
  belongs_to :order
  validates :title, presence: true
  validates :comment, presence: true
  validates :rating, inclusion: { within: (0..5),
    message: "The maximum rating is 5" }
end
