class CommentsController < ApplicationController

  def new
    
    @comment = Comment.new
    
  end
  
  def edit
    
    @comments = Plan.find(params[:id]).comments
    @customer = Customer.find(params[:customer_id])
    @comment = Comment.new
    @comment.plan_id = Plan.find(params[:id]).id
    @comment.customer_id = @customer.id
    
  end
  
  def create
    
    @customer = Customer.find(params[:customer_id])
    @comment = @customer.comments.build(com_params)
    
    if @comment.save
      flash[:success] = "Comment posted successfully"
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
    
  end
  
  def show
    
    @comments = Plan.find(params[:id]).comments
    
  end
  
  private
  
  def com_params
    
    params.require(:comment).permit(:plan_id , :description)
    
  end
  
end
