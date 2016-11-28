class ViaController < ApplicationController
  layout "all"
  def show
    @plan=Plan.find(params[:id])
  end
end
