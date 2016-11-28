class SelectionsController < ApplicationController
  layout "all"
  def index
    if Plan.exists?(Plan.all)
      @plans=Plan.select(:plan_name).distinct
    else
      flash[:notice]="No plans Available.To Create a plan Click on Insurance companies"
      redirect_to mains_path
    end
  end
  def show
    session[:present]="selections"
    session[:last_id]=params[:id]
    @plans=Plan.where(plan_name: Plan.find(params[:id]).plan_name).all
  end

end
