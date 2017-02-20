class PolicyDocumentsController < ApplicationController
  
  def new
    
    @doc = PolicyDocument.new    
    @pol = Policy.find(params[:default_pol_id])
    
  end
  
  def create
    
    @pol = Policy.find(params[:policy_id])
    @doc = @pol.policy_documents.build(doc_params)

    if @doc.save
      flash[:success] = "Document added successfully"     
      redirect_to doc_list_policy_document_path(@pol)      
    else
      render 'new'
    end
    
  end
  
  def show
    
    @doc = PolicyDocument.find(params[:id])
    
  end
  
  
  def destroy
    
    @doc = PolicyDocument.find(params[:id])
    @pol = Policy.find(@doc.policy_id)
    
    if @doc.destroy
      flash[:success] = "Document was deleted successfully"
      redirect_to doc_list_policy_document_path(@pol)
    end
    
  end
  
  def doc_list
    
    @docs = Policy.find(params[:id]).policy_documents
    @pol = Policy.find(params[:id]) 
    
  end
  
  def doc_params
    
    params.require(:policy_document).permit(:title , :image)
    
  end
  
end
