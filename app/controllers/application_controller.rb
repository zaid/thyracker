class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate
    redirect_to(root_path) unless signed_in?
  end

  helper_method :current_user

end
