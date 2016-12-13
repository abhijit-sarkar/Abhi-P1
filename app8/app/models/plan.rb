class Plan < ApplicationRecord
  belongs_to :company
  has_many :comments
  validates :plan_name,presence: true
  validates :max_tenure,presence: true
  validates :interest,presence: true
  validates :min_amount,presence: true
  validates :max_amount,presence: true
  validates :bonus,presence: true
end
