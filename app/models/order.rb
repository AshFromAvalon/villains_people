class Order < ApplicationRecord
  belongs_to :user
  belongs_to :crime
  has_one :review
  # validates :validated, presence: true
  # validates :done, presence: true
  # validates :paid, presence: true
end
