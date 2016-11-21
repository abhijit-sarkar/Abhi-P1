class ComsController < ApplicationController

	
	
def index
	@coms=Com.all
end
def new
	@com=Com.new
end
def create
	@com=Com.new(com_params)
	if @com.save
		flash[:success]="Company added successfully"
		redirect_to coms_path
	else
		render 'new'
	end
end
def destroy
	@com=Com.find(params[:id])
	
	if Plan.exists?(Plan.find_by_com_id(@com.id))
	flash[:danger]="Could not delete due to references"
	redirect_to coms_path
	
	else
	@com.destroy
	flash[:success]="Company was deleted successfully"
	redirect_to coms_path
	end
end
def show
	@com=Com.find(params[:id])
end
def edit
	@com=Com.find(params[:id])
end
def update
	@com=Com.find(params[:id])
	
	if @com.update(com_params)
		flash[:notice]="Details were updated successfully"
		redirect_to coms_path
	else
		render 'edit'
	end
end
private
def com_params
	params.require(:com).permit(:com_name,:contact,:address)
end

end
