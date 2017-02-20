class Customer < ApplicationRecord

  has_many :policies , dependent: :destroy
  has_many :comments , dependent: :destroy
  validates :customer_name , presence: true
  validates :contact , presence: true , numericality: true , length: { minimum: 10 , maximum: 10 , message: "is too short(minimum is 10 digits)" }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email , presence: true , format: { with: VALID_EMAIL_REGEX }

end
