class HomeController < ApplicationController
  layout "insurance"
  
  def index    
  end
  
  def show
    @pols = Policy.all    
  end
  
end
