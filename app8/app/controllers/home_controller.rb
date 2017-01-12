class HomeController < ApplicationController

  def index    
  end
  
  def show
    session[:pid] = params[:id]
    session[:call] = "home"
    @pols = Policy.all    
  end
  
end
