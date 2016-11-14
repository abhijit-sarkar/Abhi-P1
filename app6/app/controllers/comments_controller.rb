class CommentsController < ApplicationController
def edit
@plan=Plan.find(params[:id])
@coms=Plan.find(params[:id]).comments
@comment=Comment.new
@comment.client_id=Customer.find(session[:id]).client_id
end
def create
@comment=Comment.new(com_params)
@cust=Customer.find_by_client_id(@comment.client_id)
@plan=Plan.find_by_plan_no(@comment.plan_no)
@comment.customer_id=@cust.id
@comment.plan_id=@plan.id
if @comment.save
flash[:success]="Comment posted successfully"
redirect_to customer_path(session[:id])
else
render 'edit'
end
end
def show
@plan=Plan.find(params[:id])
@coms=Plan.find(params[:id]).comments
end
private
def com_params
params.require(:comment).permit(:plan_no,:client_id,:desc)
end
end
