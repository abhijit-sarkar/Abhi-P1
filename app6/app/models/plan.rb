class Plan < ApplicationRecord

has_many :comments

validates :plan_no,presence: true,:uniqueness => {:message => "already in use."}
validates :plan_name,presence: true
validates :company_name,presence: true
validates :duration,presence: true,:exclusion => {:in =>0..0,:message => "cannot be zero"}
validates :bonus,presence: true
validates :roi,presence: true
end
