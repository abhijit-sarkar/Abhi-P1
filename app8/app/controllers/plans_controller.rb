class PlansController < ApplicationController  
  layout "insurance"
  
  def index
    @plans = Plan.all    
  end
  
  def new
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(plan_params)	
    @plan.company_id = session[:company_id]	
    if @plan.save
      flash[:success] = "Plan added successfully"
      redirect_to list_plan_path(session[:company_id])
    else
      render 'new'
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
    session[:call] = "policy"
    @plans = Company.find(params[:id]).plans
    session[:company_id] = params[:id]
  end
  
  private
  def plan_params
    params.require(:plan).permit(:plan_name,:max_tenure,:interest,:bonus,:max_amount,:min_amount,:image)
  end

end


