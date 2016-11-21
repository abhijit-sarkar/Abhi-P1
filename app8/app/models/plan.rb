class Plan < ApplicationRecord
belongs_to :com
has_many :comments,dependent: :destroy
validates :plan_name,presence: true
validates :max_tenure,presence: true,numericality: true
validates :roi,presence: true,numericality: true
validates :bonus,presence: true,numericality: true

end
