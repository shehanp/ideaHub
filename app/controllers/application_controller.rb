class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  private

  def current_user
    if cookies.permanent[:auth_token] || cookies[:auth_token]
      @current_user ||= User.find_by_auth_token(cookies.permanent[:auth_token] || cookies[:auth_token]) 
    end
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to root_path, alert: "You need to sign in" if current_user.nil?
  end
end

