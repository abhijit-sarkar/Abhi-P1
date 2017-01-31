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
    session[:plan_id] = params[:id]
    
    if params[:id] == "cancel_policy"
      flash[:danger] = "Transaction has been cancelled successfully"
      redirect_to plans_path
    else
      session[:param_id] = params[:id]
      @plan = Plan.find(params[:id])
    end
    
  end
  
  
  def check_data
    
    @cust = Customer.where(customer_name: params[:customer_name].upcase,contact: params[:contact],email: params[:email]).first
    
    if Customer.exists?(@cust)
      flash[:notice] = "Customer exists"      
      redirect_to edit_policy_path(@cust.id)
    else      
      @customer = Customer.new
      @customer.customer_name = params[:customer_name].upcase
      @customer.contact = params[:contact]
      @customer.email = params[:email]
      if @customer.save
	flash[:notice] = "New Customer"
	@cust = Customer.last
        redirect_to edit_policy_path(@cust.id)
      end
    end
    
  end

  
  def edit   
    @pol = Policy.new
    @plan = Plan.find(session[:plan_id])
    session[:id] = params[:id]
  end
  
  def create
    session[:controller]  = "policy"
    @plan = Plan.find(session[:plan_id])
    
    @pol = Policy.new
    @pol.customer_id = session[:id]
    @pol.plan_id = session[:plan_id]
    @pol.sum_insured = params[:sum_insured].to_f
    @pol.duration = params[:duration].to_f
    @pol.nominee = params[:nominee]
    @pol.premium_mode = params[:premium_mode]
    @pol.status = "Active"
    @pol.maturity_date = (Time.now.to_date + params[:duration].to_i.year).to_date
    @pol.maturity_amount = (params[:sum_insured].to_f * ( 1 + ( Plan.find(session[:plan_id] ).interest.to_f * params[:duration].to_f) / 100)).to_f
        
    if params[:premium_mode] == "Monthly"
      @pol.premium = ( params[:sum_insured].to_f / ( params[:duration].to_f * 12.to_f ) ).to_f
    end
    if params[:premium_mode] == "Yearly"
      @pol.premium = ( params[:sum_insured].to_f / ( params[:duration].to_f * 1.to_f ) ).to_f
    end
    if params[:premium_mode] == "Quarterly"
      @pol.premium = ( params[:sum_insured].to_f / ( params[:duration].to_f * 4.to_f ) ).to_f
    end
        
    if @pol.save
      flash[:success] = "Plan added successfully to " + Customer.find(session[:id]).customer_name
      session[:last_policy_id] = Policy.order("created_at").last.id 
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
    params.require(:policy).permit( :plan_id , :sum_insured , :duration , :premium_mode , :premium , :nominee , :maturity_amount , :maturity_date)
  end
  
  def pol_params
    params.require(:policy).permit( :plan_id , :sum_insured , :duration , :premium_mode , :nominee )
  end
  
end
