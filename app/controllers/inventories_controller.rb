class InventoriesController < ApplicationController
  respond_to :json
  before_action :token_reset



  def index
    render 'index'
  end

  private

  def token_reset
    current_user.authentication_token = Devise.friendly_token
    current_user.save!
  end
end