module ApplicationHelper
  def token_reset
    current_user.authentication_token = Devise.friendly_token
    current_user.save!
  end
end
