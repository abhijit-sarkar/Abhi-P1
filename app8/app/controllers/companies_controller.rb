class CompaniesController < ApplicationController
  
  def index
    @coms = Company.all
  end
  
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(com_params)
    if @company.save
      flash[:success] = "Company added successfully"
      redirect_to companies_path
    else
      render 'new'
    end
  end
  
  def destroy
    @com = Company.find(params[:id])
    if Plan.exists?(Plan.find_by_company_id(@com.id))
      if Policy.exists?(Policy.find_by_plan_id(Plan.find_by_company_id(@com.id).id))
	flash[:danger] = "Could not delete this company.There are customers who are under the benefits of any plan(s) under this company."
	redirect_to companies_path
      else
	@com.destroy
	flash[:success] = "Company was deleted successfully"
	redirect_to companies_path
      end
    else
      @com.destroy
      flash[:success] = "Company was deleted successfully"
      redirect_to companies_path
    end
  end
  
  def show
    @com = Company.find(params[:id])
  end
  
  def edit
    @com = Company.find(params[:id])
  end
  
  def update
    @com = Company.find(params[:id])   
    if @com.update(com_params)
      flash[:notice] = "Details were updated successfully"
      redirect_to companies_path
    else
      render 'edit'
    end
  end
  
  private
  def com_params
    params.require(:company).permit(:company_name,:contact,:address)
  end

end
