class CustomsController < ApplicationController
  layout "all"
  def show
    @plan=Plan.find(params[:id])

  end
  def check_data
    session[:md]=true
    @cust=Customer.where(cust_name: params[:cust_name],contact: params[:contact],email: params[:email]).first
    
    if Customer.exists?(@cust)
      flash[:notice]="Customer exists"
      session[:id]=@cust.id
      session[:plan_id]=params[:plan_id]

      session[:duration]=params[:duration]
      session[:premium]=params[:premium]
      redirect_to edit_pol_path(session[:plan_id])
    else
      
      @customer=Customer.new
      @customer.cust_name=params[:cust_name]
      @customer.contact=params[:contact]
      @customer.email=params[:email]
      session[:plan_id]=params[:plan_id]
      session[:duration]=params[:duration]
      session[:premium]=params[:premium]
      if @customer.save
	flash[:notice]="New Customer"
        @cus=Customer.find_by_contact(params[:contact])
        session[:id]=@cus.id
        redirect_to edit_pol_path(session[:plan_id])
      else
	if Customer.exists?(Customer.find_by_email(params[:email]))
	  flash[:danger]="Email ID entered is in use by some existing customer"
	  session[:md]=false
	end
	if Customer.exists?(Customer.find_by_contact(params[:contact]))
	  flash[:danger]="Contact number entered is registered to some existing customer"
	  session[:md]=false
	end
	if (Customer.exists?(Customer.find_by_email(params[:email]))) && (Customer.exists?(Customer.find_by_contact(params[:contact])))
	  flash[:danger]="Contact number and Email ID is already registered with some other customer"
	  session[:md]=false
	end
	if session[:md]
	  s2=""			
	  if params[:contact].length < 10
	    s2="Contact length is too short(Min. is 10 digits)."
	  end
	  
	  flash[:danger]=s2
	end
        redirect_to custom_path(params[:plan_id])

      end
    end
  end
end
