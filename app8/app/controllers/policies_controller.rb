class PoliciesController < ApplicationController
  
  def policy_details
    
    @pol = Policy.find(params[:id])
    @docs = @pol.policy_documents
    @plan = Plan.find(@pol.plan_id)
    session[:policy_id] = @pol.id
    
  end
  
  def send_mail
    
    @pol = Policy.find(params[:id])
    UserMailer.signup_confirmation(@pol).deliver_now
    flash[:notice] = "Email send successfully"   
    redirect_to policy_details_policy_path(@pol.id)
    
  end
  
  def edit
    
    @pol = Policy.new
    @customer = Customer.new
    @plan = Plan.find(params[:id])	
    session[:id] = params[:id]
    
  end
  
  def create
    
    @cust = Customer.where(customer_name: params[:customer_name].upcase,contact: params[:contact],email: params[:email]).first
    if Customer.exists?(@cust)
      flash[:notice] = "Customer exists"            
    else      
      @customer = Customer.new
      @customer.customer_name = params[:customer_name].upcase
      @customer.contact = params[:contact]
      @customer.email = params[:email]
      if @customer.save
	flash[:notice] = "New Customer"
	@cust = Customer.last 
      end
      
    end
    
    @plan = Plan.find(params[:plan_id])
    
    @pol = Policy.new
    @pol.customer_id = @cust.id
    @pol.plan_id = params[:plan_id]
    @pol.sum_insured = params[:sum_insured].to_f
    @pol.duration = params[:duration].to_f
    @pol.nominee = params[:nominee]
    @pol.premium_mode = params[:premium_mode]
    @pol.status = "Active"
    @pol.maturity_date = (Time.now.to_date + params[:duration].to_i.year).to_date
    @pol.maturity_amount = (params[:sum_insured].to_f * ( 1 + ( Plan.find(params[:plan_id] ).interest.to_f * params[:duration].to_f) / 100)).to_f
    
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
      flash[:success] = "Plan added successfully to " + Customer.find(@cust.id).customer_name      
      redirect_to doc_list_policy_document_path(Policy.last)
    else
      render 'edit'
    end
    
  end
  
  def policy_list
    
    session[:call] = "poll"
    @pols = Policy.all
    
  end
  
  def destroy
    
    @pol = Policy.find(params[:id])
    @pol.destroy
    flash[:success] = "Policy was unsubscribed successfully"
    redirect_to customer_path(session[:id])
    
  end
  
  
end
