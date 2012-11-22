class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end


  private
  def confirmed
    return current_user.confirmed if current_user
    return false
  end
  helper_method :confirmed

  def current_user
    @current_user ||= User.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def admin
    return current_user.admin if current_user
    return false
  end
  helper_method :admin

end
