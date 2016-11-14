class PlansController < ApplicationController
layout "plan"
def index
@plans=Plan.all
end
def new

@plan=Plan.new
end
def show
@plan=Plan.find(params[:id])
end
def destroy
@plan=Plan.find(params[:id])
@pol=Pol.find_by_plan_no(@plan.plan_no)
if Pol.exists?(@pol)
	flash[:notice]="Plan/plan details cannot be deleted. It is subscribed to a customer.You can only modify the details"
	redirect_to plans_path
else
@plan.destroy
flash[:notice]="Plan was deleted successfully"
redirect_to plans_path
end
end
def create
@plan=Plan.new(plan_params)
if @plan.save
flash[:success]="Plan added successfully"
redirect_to plans_path
else
render 'new'
end
end
def edit
@plan=Plan.find(params[:id])
end
def update
	@plan=Plan.find(params[:id])
	
	if @plan.update(plan_params)
		flash[:notice]="Plan was updated successfully"
		redirect_to plans_path
	else
		render 'edit'
	end
	
end

private
def plan_params
params.require(:plan).permit(:plan_no,:plan_name,:company_name,:duration,:bonus,:roi)
end
def p_params
params.require(:plan).permit(:company_name)
end

end
