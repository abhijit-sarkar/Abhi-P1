class CustomersController < ApplicationController

def index
	@custs=Customer.all
end
def new
	@customer=Customer.new
end
def create
	@customer=Customer.new(cust_params)
	if @customer.save
		flash[:success]="Customer added successfully"
		redirect_to customers_path
	else
		render 'new'
	end
end
def destroy
	@cust=Customer.find(params[:id])
	if Pol.exists?(Pol.find_by_customer_id(@cust.id))
	flash[:danger]="Could not delete.Customer is already subscribed to some policy"
	redirect_to customers_path
	else
	@cust.destroy
	flash[:success]="Customer was deleted successfully"
	redirect_to customers_path
	end
end
def show
	@cust=Customer.find(params[:id])
	session[:id]=@cust.id
	@pols=Customer.find(params[:id]).pols
end
def edit
	@cust=Customer.find(params[:id])
end
def update
	@cust=Customer.find(params[:id])
	if @cust.update(cust_params)
		flash[:notice]="Customer details were updated successfully"
		redirect_to customers_path
	else
		render 'edit'
	end
	
end
private
def cust_params
	params.require(:customer).permit(:cust_name,:email,:contact)
end
end


