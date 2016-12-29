class CommentsController < ApplicationController
  layout "insurance"
  
  def new
    @comment = Comment.new
  end
  
  def edit
    @comments = Plan.find(params[:id]).comments
    @comment = Comment.new
    @comment.plan_id = Plan.find(params[:id]).id
    @comment.customer_id = session[:id]
  end
  
  def create
    @comment = Comment.new(com_params)
    if @comment.save
      flash[:success] = "Comment posted successfully"
      redirect_to customer_path(session[:id])
    else
      render 'edit'
    end
  end
  
  def show
    @comments = Plan.find(params[:id]).comments
  end
  
  private
  def com_params
    params.require(:comment).permit(:plan_id,:customer_id,:description)
  end
  
end
