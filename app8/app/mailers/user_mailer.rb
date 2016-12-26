class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(pol)
    @pol = pol
    @greeting = "Hi"
    mail to: Customer.find(@pol.customer_id).email, subject: "Policy Details"
  end
end
