class ItemsController < ApplicationController
  respond_to :json
  before_action :set_item, only: [:show, :update, :destroy]
  before_action :check_existing_item_authorization, only: [:show, :update, :destroy]
  before_action :check_matching_inventory, only: [:create]

  def index
    @items = current_user.items

  end

  def show
  end

  def create
    @item = Item.new check_params
    if @item.save
      render 'show'
    else
      head :bad_request
    end
  end

  def update
    fieldvalue = Fieldvalue.find(params[:fieldvalue_id])
    head :bad_request unless @item.fieldvalues.include?(fieldvalue)
    fieldvalue.value = params[:value]
  end

  def destroy
    if Item.destroy(@item)
      head :ok
    else
      head :bad_request
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def check_existing_item_authorization
    head :bad_request unless @item.inventory.user == current_user
  end

  def check_matching_inventory
    head :bad_request unless Inventory.find(params[:inventory_id]).user == current_user
  end

  def check_params
    params.permit(:inventory_id)
  end
end