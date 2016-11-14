class PolsController < ApplicationController
def edit
@plan=Plan.find(params[:id])
@pol=Pol.new
@pol.plan_no=@plan.plan_no
@pol.client_id=Customer.find(session[:id]).client_id
end
def destroy
@pol=Pol.find(params[:id])
@pol.destroy
flash[:notice]="Policy was unsubscribed successfully"
redirect_to customer_path(session[:id])
end
def create
@pol=Pol.new(pol_params)
@cust=Customer.find_by_client_id(@pol.client_id)
@pol.cname=@cust.cname
@pol.customer_id=@cust.id
@pol.status="Active"
if @pol.save
flash[:success]="Plan added to your account successfully"
redirect_to customer_path(session[:id])
else
flash[:error]="Purchase failed.Fields were empty"
redirect_to customer_path(session[:id])
end
end

private
def pol_params
params.require(:pol).permit(:client_id,:cname,:nominee,:sum_insured,:premium,:plan_no,:maturity_date)
end
end
