class PolsController < ApplicationController
def edit
	@plan=Plan.find(params[:id])
	@pol=Pol.new
	@pol.plan_id=@plan.id
	@pol.customer_id=session[:id]
end
def create
	@pol=Pol.new(plan_params)
	if @pol.save
		flash[:success]="Plan was bought successfully"
		redirect_to customer_path(session[:id])
	else
		flash[:danger]="Purchase failed due to empty fields"
		redirect_to customers_path(session[:id])
	end
end
def destroy
	@pol=Pol.find(params[:id])
	@pol.destroy
	flash[:success]="Policy was unsubscribed successfully"
	redirect_to customer_path(session[:id])
end
private
def plan_params
	params.require(:pol).permit(:plan_id,:customer_id,:sum_insured,:duration,:premium,:nominee,:maturity_amount,:maturity_date)
end
end
