class BuysController < ApplicationController
def index
@plans=Plan.all
end
def show
@plan=Plan.find(params[:id])
end
end
