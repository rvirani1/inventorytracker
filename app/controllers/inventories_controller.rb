class InventoriesController < ApplicationController
  respond_to :json

  def index
    #todo how do I put this somewhere where it doesn't repeat
    @inventories = current_user.inventories
    binding.pry
    render 'index'
  end

  def show

    render 'show'
  end

  def create
    render 'show'
  end

  def update
    render 'show'
  end

  def destroy
  end
end