class Plan < ApplicationRecord
belongs_to :com
has_many :comments,dependent: :destroy
validates :plan_name,presence: true
validates :max_tenure,presence: true
validates :roi,presence: true
validates :bonus,presence: true

end
