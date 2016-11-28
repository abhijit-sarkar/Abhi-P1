class CalsController < ApplicationController
  layout "all"
  def show
    session[:present]="cals"
    session[:last_id]=params[:id]
    @plans=Com.find(params[:id]).plans
    session[:id]=params[:id]
  end
end
