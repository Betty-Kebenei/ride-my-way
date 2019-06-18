class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :require_login
  before_action :require_logout

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = 'You must be logged in to access the application'
      redirect_to '/login' #
    end
  end

  def require_logout
    if logged_in?
      flash[:error] = 'You must be logged out to access the login page'
      redirect_to '/' #
    end
  end
end
