class PolicyDocumentsController < ApplicationController
  
  def new
    
    @doc = PolicyDocument.new
    @pol = Policy.last
    
  end
  
  def create
    
    if session[:call] == "doc_list"
      @pol = Policy.last	
    else
      @pol = Policy.find(session[:policy_id])
    end
    
    @doc = @pol.policy_documents.build(doc_params)

    if @doc.save
      flash[:success] = "Document added successfully"
      if session[:call] == "doc_list"
        redirect_to doc_list_policy_document_path(@pol)
      else
	redirect_to policy_details_policy_path(session[:policy_id])
      end
    else
      render 'new'
    end
    
  end
  
  def show
    
    @doc = PolicyDocument.find(params[:id])
    
  end
  
  def list
    
    @docs = Policy.find(params[:id]).policy_documents
    @pol = Policy.find(params[:id])
    session[:call] = "docl"
    
  end
  
  def destroy
    
    @doc = PolicyDocument.find(params[:id])
    session[:last_doc_pol_id] = @doc.policy_id
    if @doc.destroy
      flash[:success] = "Document was deleted successfully"
      if session[:call] == "doc_list"
        redirect_to doc_list_policy_document_path(session[:last_doc_pol_id])
      else
	redirect_to policy_details_policy_path(session[:last_doc_pol_id])
      end
    end
    
  end
  
  def doc_list
    
    @docs = Policy.find(params[:id]).policy_documents
    @pol = Policy.find(params[:id])
    session[:call] = "doc_list"
    
  end
  
  def doc_params
    
    params.require(:policy_document).permit(:title , :image)
    
  end
  
end
