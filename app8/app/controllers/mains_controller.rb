class MainsController < ApplicationController
def index
end
def destroy
	@pol=Pol.find(params[:id])
	@pol.update(:status => "Surrendered")
	flash[:notice]="Policy was surrendered successfully"
	redirect_to customer_path(session[:id])
end
end
