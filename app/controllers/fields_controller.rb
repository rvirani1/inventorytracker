class FieldsController < ApplicationController
  respond_to :json
  before_action :set_field, only: [:show, :update, :destroy]
  before_action :check_authorization, only: [:show, :update, :destroy]

  def index
    @inventory = Inventory.find(params[:inventory_id])
    @fields = @inventory.template_fields
  end

  def show
  end

  def create
    @field = Inventory.find(params[:inventory_id]).template_fields.new create_params

    if @field.save
      render 'show'
    else
      head :bad_request
    end
  end

  private

  def create_params
    params.permit(:name, :user_values, :default_values, :structure)
  end

  def set_field
    @field = Field.find(params[:id])
  end

  def check_authorization
    head :bad_request unless @field.inventories.first.user == current_user
  end

end