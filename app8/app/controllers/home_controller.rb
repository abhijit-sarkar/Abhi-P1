class HomeController < ApplicationController

  def show
    session[:pid] = params[:id]
    session[:call] = "home"
    @pols = Policy.all    
  end
  
end
