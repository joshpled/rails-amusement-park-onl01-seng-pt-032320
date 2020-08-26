class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :verify_user

  def current_user
    User.find_by_id(session[:user_id])
  end

  def verify_user
    redirect_to root_path unless !!current_user
  end


end
