class Com < ApplicationRecord
has_many :plans,dependent: :destroy
validates :com_name,presence: true
validates :contact,presence: true,numericality: true,length: {minimum: 10, maximum: 10,:message=> "is too short(minimum is 10 digits)"}
validates :address,presence: true
end
