class Comment < ApplicationRecord
belongs_to :plan
validates :desc,presence: true
end
