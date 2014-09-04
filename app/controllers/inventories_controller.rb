class InventoriesController < ApplicationController
  respond_to :json
  before_action :set_inventory, only: [:show, :update, :destroy]
  before_action :check_authorization, only: [:show, :update, :destroy]

  def index
    @inventories = current_user.inventories
    render 'index'
  end

  def show
    render 'show'
  end

  def create
    inventory = current_user.inventories.new name: params[:name]
    if inventory.save
      render 'show'
    else
      render json: "Failed"
    end
  end

  def update
    @inventory.name = params[:name]
    if @inventory.save
      render 'show'
    else
      render json: "Failed"
    end
  end

  def destroy
    if Inventory.destroy(@inventory)
      head :OK
    else
      render json: "Failed"
    end
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def check_authorization
    @inventory.user == current_user
  end
end