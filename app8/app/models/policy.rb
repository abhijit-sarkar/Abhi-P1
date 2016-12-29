class Policy < ApplicationRecord
  belongs_to :customer
  belongs_to :plan
  has_many :policy_documents,dependent: :destroy
  validates :plan_id,presence: true
  validates :customer_id,presence: true
  validates :sum_insured,presence: true
  validates :duration,presence: true,:exclusion => {:in =>0..0,:message => "cannot be zero"}
  validates :nominee,presence: true
end
