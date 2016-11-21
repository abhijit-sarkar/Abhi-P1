class CalsController < ApplicationController
def show
	@plans=Com.find(params[:id]).plans
	session[:id]=params[:id]
end
end
