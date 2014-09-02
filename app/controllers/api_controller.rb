class ApiController < ApplicationController
  before_filter :check_auth

  private

  def check_auth
    authenticate_or_request_with_http_basic do |username, password|
      resource = User.find_by_email(username)
      sign_in(:user, resource) if resource.valid_password?(password)
    end
  end

end