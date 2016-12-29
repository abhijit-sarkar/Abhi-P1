class Plan < ApplicationRecord
  belongs_to :company
  has_many :comments
  has_many :policies
  before_validation :capitalize_plan_name
  validates_uniqueness_of :plan_name, :scope => [:company_id],:message => "already exists under this company.You may edit the plan from edit page if necessary.",on: :create
  validates :plan_name,presence: true
  validates :max_tenure,presence: true
  validates :interest,presence: true
  validates :min_amount,presence: true
  validates :max_amount,presence: true
  validates :bonus,presence: true
  validates :min_amount, :numericality => { :greater_than => 0,:less_than_or_equal_to => :max_amount}
  validates :max_amount, :numericality => { :greater_than =>0}

  
  def capitalize_plan_name
    self.plan_name=self.plan_name.capitalize
  end
end
