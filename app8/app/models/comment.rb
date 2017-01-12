class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :plan
  validates :description , presence: true
  
end
