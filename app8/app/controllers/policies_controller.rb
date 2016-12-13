class PoliciesController < ApplicationController
  layout "insurance"
  
  def show
    if params[:id] == "cancel_policy"
      flash[:danger] = "Transaction has been cancelled"
      redirect_to plans_path
    else
      session[:param_id] = params[:id]
      @plan = Plan.find(params[:id])
    end
  end
  
  def check_data
    exist = true
    @cust = Customer.where(customer_name: params[:customer_name].upcase,contact: params[:contact],email: params[:email]).first    
    if Customer.exists?(@cust)
      flash[:notice] = "Customer exists"
      session[:id] = @cust.id
      session[:plan_id] = params[:plan_id]
      session[:duration] = params[:duration]
      session[:premium] = params[:premium]
      session[:premium_mode] = params[:premium_mode]
      if params[:premium_mode] === "Monthly"
	session[:premium_mode_no] = 12;
      end
      if params[:premium_mode] === "Quarterly"
	session[:premium_mode_no] = 4;
      end
      if params[:premium_mode] === "Yearly"
	session[:premium_mode_no] = 1;
      end
      redirect_to edit_policy_path(session[:plan_id])
    else      
      @customer = Customer.new
      @customer.customer_name = params[:customer_name].upcase
      @customer.contact = params[:contact]
      @customer.email = params[:email]
      session[:plan_id] = params[:plan_id]
      session[:duration] = params[:duration]
      session[:premium] = params[:premium]
      session[:premium_mode] = params[:premium_mode]
      if params[:premium_mode] === "Monthly"
	session[:premium_mode_no] = 12;
      end
      if params[:premium_mode] === "Quarterly"
	session[:premium_mode_no] = 4;
      end
      if params[:premium_mode] === "Yearly"
	session[:premium_mode_no] = session[:duration];
      end
      if @customer.save
	flash[:notice] = "New Customer"
        @cus=Customer.find_by_contact(params[:contact])        
	session[:id] = @cus.id
        redirect_to edit_policy_path(session[:plan_id])
      else
	if Customer.exists?(Customer.find_by_email(params[:email]))
	  flash[:danger] = "Email ID entered is in use by some existing customer"
	  exist = false
	end
	if Customer.exists?(Customer.find_by_contact(params[:contact]))
	  flash[:danger] = "Contact number entered is registered to some existing customer"
	  exist = false
	end
	if (Customer.exists?(Customer.find_by_email(params[:email]))) && (Customer.exists?(Customer.find_by_contact(params[:contact])))
	  flash[:danger] = "Contact number and Email ID is already registered with some other customer"
	  exist = false
	end
	if exist
	  s2 = ""			
	  if params[:contact].length < 10
	    s2 = "Contact length is too short(Min. is 10 digits)."
	  end	  
	  flash[:danger] = s2
	end
        redirect_to policy_path(session[:param_id])
      end
    end
  end
  
  def edit
    @plan = Plan.find(session[:plan_id])
    @pol = Policy.new
    @pol.plan_id = @plan.id
    @pol.customer_id = session[:id]
  end
  
  def create	
    @pol = Policy.new(plan_params)
    if @pol.save
      flash[:success] = "Plan added successfully to " + Customer.find(session[:id]).customer_name
      redirect_to transactions_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @pol = Policy.find(params[:id])
    @pol.destroy
    flash[:success] = "Policy was unsubscribed successfully"
    redirect_to customer_path(session[:id])
  end
  
  private
  def plan_params
    params.require(:policy).permit(:plan_id,:customer_id,:sum_insured,:duration,:premium_mode,:premium,:nominee,:maturity_amount,:maturity_date)
  end
  
end
