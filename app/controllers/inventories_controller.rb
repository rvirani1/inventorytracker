class InventoriesController < ApplicationController
  respond_to :json
  before_action :set_inventory, only: [:show, :update, :destroy]
  before_action :check_authorization, only: [:show, :update, :destroy]

  def index
    @inventories = current_user.inventories
  end

  def show
  end

  def create
    inventory = current_user.inventories.new name: params[:name]
    if inventory.save
      render 'show'
    else
      head :bad_request
    end
  end

  def update
    @inventory.update params
    if @inventory.save
      render 'show'
    else
      head :bad_request
    end
  end

  def destroy
    if Inventory.destroy(@inventory)
      head :OK
    else
      head :bad_request
    end
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def check_authorization
    head :bad_request unless @inventory.user == current_user
  end
end