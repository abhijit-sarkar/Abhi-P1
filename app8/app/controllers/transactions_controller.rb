class TransactionsController < ApplicationController
  
  def index
    @pol = Policy.last
  end
  
  def send_mail
    @pol = Policy.find(params[:id])

    UserMailer.signup_confirmation(@pol).deliver_now
    flash[:notice] = "Email send successfully"
    redirect_to plans_path
    
  end
  
end
