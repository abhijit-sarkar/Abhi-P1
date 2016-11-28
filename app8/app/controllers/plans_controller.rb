class PlansController < ApplicationController
  layout "all"
  def new
    @plan=Plan.new
  end
  def create
    @plan=Plan.new(plan_params)
    @plan.com_id=session[:id]
    if @plan.save
      flash[:success]="Plan added successfully"
      redirect_to cal_path(session[:id])
    else
      render 'new'
    end
  end
  def destroy
    @plan=Plan.find(params[:id])
    if Pol.exists?(Pol.find_by_plan_id(@plan.id))
      flash[:danger]="Could not delete.Customers are already subscribed to this policy"
      redirect_to cal_path(session[:id])
    else
      @plan.destroy
      flash[:success]="Plan was deleted successfully"
      redirect_to cal_path(session[:id])
    end
  end
  def show
    @plan=Plan.find(params[:id])
  end
  def edit
    @plan=Plan.find(params[:id])
  end
  def update
    @plan=Plan.find(params[:id])
    @plan.com_id=session[:id]
    if @plan.update(plan_params)
      flash[:notice]="Plan Deails were updated successfully"
      redirect_to cal_path(session[:id])
    else
      render 'edit'
    end
  end
  private
  def plan_params
    params.require(:plan).permit(:plan_name,:max_tenure,:roi,:bonus)
  end

end


