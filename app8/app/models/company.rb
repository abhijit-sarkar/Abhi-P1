class Company < ApplicationRecord
  has_many :plans,dependent: :destroy
  before_validation :capitalize_company_name
  validates :company_name,presence: true
  validates :contact,presence: true,length: {minimum: 10, maximum: 10,:message=> "is too short(minimum is 10 digits)"}
  validates :address,presence: true
  validates :company_name,:uniqueness => {:message => " is already registered.You may edit the company name from edit page if necessary."}
  validates :contact,:uniqueness => {:message => "is already assigned to some other company"}
  def capitalize_company_name
    self.company_name = self.company_name.capitalize
    self.address = self.address.capitalize
  end
end
