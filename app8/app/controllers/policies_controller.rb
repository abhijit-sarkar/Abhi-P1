class PoliciesController < ApplicationController
  
  def policy_list
    session[:controller] = "other"
    session[:control] = "0"
    session[:paramid] = params[:id]

    if params[:id] == "list"
      session[:call] = "list"
      @pols = Policy.all
    else
      session[:call] = "plan"
      @pols= Plan.find(params[:id]).policies
    end
    
  end
  
  def policy_details
    session[:control] = "1"
    session[:cur_pol_id] = params[:id]
    @pol = Policy.find(params[:id])
  end
  
  def send_mail
   @pol = Policy.find(params[:id])

   UserMailer.signup_confirmation(@pol).deliver_now
    flash[:notice] = "Email send successfully"

    if session[:control] == "1"
      redirect_to policy_details_policy_path(session[:cur_pol_id])
    else
      redirect_to policy_list_policy_path(session[:paramid])
    end
    
  end
  
  def show
    session[:controller] = "policy"

    if params[:id] == "cancel_policy"
      flash[:danger] = "Transaction has been cancelled successfully"
      redirect_to plans_path
    else
      session[:param_id] = params[:id]
      @plan = Plan.find(params[:id])
    end
    
  end
  
  def check_data
    if params[:premium_mode] === "Monthly"
      session[:premium_mode_no] = 12;
    end
    
    if params[:premium_mode] === "Quarterly"
      session[:premium_mode_no] = 4;
    end
    
    if params[:premium_mode] === "Yearly"
      session[:premium_mode_no] = 1;
    end
    
    session[:plan_id] = params[:plan_id]
    session[:duration] = params[:duration]
    session[:premium] = params[:premium]
    session[:premium_mode] = params[:premium_mode]

    @cust = Customer.where(customer_name: params[:customer_name].upcase,contact: params[:contact],email: params[:email]).first    

    if Customer.exists?(@cust)
      flash[:notice] = "Customer exists"
      session[:id] = @cust.id
      redirect_to edit_policy_path(session[:plan_id])
    else      
      @customer = Customer.new
      @customer.customer_name = params[:customer_name].upcase
      @customer.contact = params[:contact]
      @customer.email = params[:email]
      if @customer.save
	flash[:notice] = "New Customer"
        @cus=Customer.find_by_contact(params[:contact])        
	session[:id] = @cus.id
        redirect_to edit_policy_path(session[:plan_id])
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
    session[:controller]  = "policy"

    @customer = Customer.find(session[:id])
    @pol = @customer.policies.build(plan_params)

    if @pol.save
      flash[:success] = "Plan added successfully to " + Customer.find(session[:id]).customer_name
      session[:last_policy_id] = Policy.last.id 
      redirect_to list_policy_document_path(session[:last_policy_id])
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
    params.require(:policy).permit(:plan_id , :sum_insured , :duration , :premium_mode , :premium , :nominee , :maturity_amount , :maturity_date)
  end
  
end
