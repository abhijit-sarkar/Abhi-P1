class Company < ApplicationRecord
  has_many :plans,dependent: :destroy
  validates :company_name,presence: true
  validates :contact,presence: true,length: {minimum: 10, maximum: 10,:message=> "is too short(minimum is 10 digits)"}
  validates :address,presence: true
  validates :company_name,:uniqueness => {:message => " is already registered"}
  validates :contact,:uniqueness => {:message => "is already assigned to some other company"}
  
end
