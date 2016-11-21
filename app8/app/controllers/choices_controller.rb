class ChoicesController < ApplicationController
def index
	@coms=Com.all
end
def show 
	
	@plans=Com.find(params[:id]).plans
end
end
