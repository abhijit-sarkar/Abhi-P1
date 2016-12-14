class PlansController < ApplicationController
    
  def index
    @plans = Plan.all    
  end
  
  def new
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(plan_params)
    @plan.company_id = session[:company_id]	
    if Plan.exists?(Plan.where(company_id: session[:company_id],plan_name:@plan.plan_name)	)
      flash[:danger] = "Plan with same name already exists.You may edit the plan if necessary."
      redirect_to list_plan_path(session[:company_id])
    else
      if @plan.max_amount > @plan.min_amount
	if @plan.save
	  flash[:success] = "Plan added successfully"
	  redirect_to list_plan_path(session[:company_id])
	else
	  render 'new'
	end
      else
	flash[:danger] = "Minimum Policy Amount cannot be greater than Maximum Policy Amount"
	render 'new'
      end
    end
  end
  
  
  def destroy
    @plan = Plan.find(params[:id])
    if Policy.exists?(Policy.find_by_plan_id(@plan.id))
      flash[:danger] = "Could not delete this plan.There are customers who are under the benefits of this plan"
      redirect_to list_plan_path(session[:company_id])
    else
      @plan.destroy
      flash[:success] = "Plan was deleted successfully"
      redirect_to list_plan_path(session[:company_id])
    end
  end
  
  def show
    @plan = Plan.find(params[:id])
  end
  
  def edit
    @plan = Plan.find(params[:id])
  end
  
  def update
    @plan = Plan.find(params[:id])
    @plan.company_id = session[:company_id]
    if @plan.update(plan_params)
      flash[:notice] = "Plan Deails were updated successfully"
      redirect_to list_plan_path(session[:company_id])
    else
      render 'edit'
    end
  end
  
  def list	
    @plans = Company.find(params[:id]).plans
    session[:company_id] = params[:id]
  end
  
  private
  def plan_params
    params.require(:plan).permit(:plan_name,:max_tenure,:interest,:bonus,:max_amount,:min_amount)
  end

end


