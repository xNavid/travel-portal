class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  helper_method :current_manager, :logged_in?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def current_manager
    @current_user ||= Manager.find(session[:manager_id]) if session[:manager_id]
  end
  def logged_in?
    !!current_user
  end
  def require_user
    if !logged_in?
      flash[:danger] = "You must login first"
      redirect_to login_path
    end
  end
  
  def current_manager
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
