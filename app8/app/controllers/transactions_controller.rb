class TransactionsController < ApplicationController
    
  def index
    @pol = Policy.last
  end
  
end
