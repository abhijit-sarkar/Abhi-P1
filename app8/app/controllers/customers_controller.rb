class CustomersController < ApplicationController

  def new
    
    @customer = Customer.new
    
  end
  
  def create
    
    @customer = Customer.new(cust_params)

    if @customer.save
      flash[:success] = "Customer added successfully"
      redirect_to customers_path
    else
      render 'new'
    end
    
  end
  
  def index
    
    @custs = Customer.all
    
  end
  
  def destroy
    
    @cust = Customer.find(params[:id])

    if Policy.exists?(Policy.find_by_customer_id(@cust.id))
      flash[:danger] = "Could not delete.This customer is currently under the benefits of one/more policy."
      redirect_to customers_path
    else
      @cust.destroy
      flash[:success] = "Customer was deleted successfully"
      redirect_to customers_path
    end
    
  end
  
  def show
    
    @cust = Customer.find(params[:id])    
    @pols = Customer.find(params[:id]).policies
    
  end
  
  def edit
    
    @cust = Customer.find(params[:id])
    
  end
  
  def update
    
    @cust = Customer.find(params[:id])
    
    if @cust.update(cust_params)
      flash[:notice] = "Customer details were updated successfully"
      redirect_to customers_path
    else
      render 'edit'
    end
    
  end
  
  def surrender
    
    @policy = Policy.find(params[:id])
    @policy.update(status: "Surrendered")
    flash[:notice] = "Policy surrendered successfully"
    redirect_to customer_path(@policy.customer_id)
    
  end
  
  private
  
  def cust_params
    
    params.require(:customer).permit(:customer_name , :email , :contact)
    
  end
  
end


