class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= Login.find(session[:login_id]) if session[:login_id]
  end

  def logged_in?
    !!current_user
  end

  def must_login
    if !logged_in?
      flash[:danger] = "Please login!"
      redirect_to login_path
    end
  end
end
