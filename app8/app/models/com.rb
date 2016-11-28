class Com < ApplicationRecord
has_many :plans,dependent: :destroy
validates :com_name,presence: true
validates :contact,presence: true,length: {minimum: 10, maximum: 10,:message=> "is too short(minimum is 10 digits)"}
validates :address,presence: true
validates :com_name,:uniqueness => {:message=>" is already registered"}
validates_uniqueness_of :contact
end
