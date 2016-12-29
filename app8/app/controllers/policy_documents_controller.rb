class PolicyDocumentsController < ApplicationController
  layout "insurance"
  
  def list
    @docs = Policy.find(params[:id]).policy_documents
    session[:pol_id] = params[:id]
  end
  
  def new
    @doc = PolicyDocument.new
  end
  
  def create
    @doc = PolicyDocument.new(doc_params)	
    @doc.policy_id = session[:pol_id]	
    if @doc.save
      flash[:success] = "Document added successfully"
      redirect_to list_policy_document_path(session[:pol_id])
    else
      render 'new'
    end
  end
  
  def show
    @doc = PolicyDocument.find(params[:id])
  end
  
  def destroy
    @doc = PolicyDocument.find(params[:id])
    if @doc.destroy
      flash[:success] = "Document was deleted successfully"
      redirect_to list_policy_document_path(session[:pol_id])
    end
  end
  
  def doc_params
    params.require(:policy_document).permit(:title,:image)
  end
end
