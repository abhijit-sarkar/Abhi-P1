class Pol < ApplicationRecord
belongs_to :customer
validates :plan_id,presence: true
validates :customer_id,presence: true
validates :sum_insured,presence: true,numericality: true
validates :duration,presence: true,:exclusion => {:in =>0..0,:message => "cannot be zero"},numericality: true
validates :nominee,presence: true
end
