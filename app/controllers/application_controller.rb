class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  def current_user 
    if session[:user]
      session[:user]
    end
  end

  def authorized
    if !current_user
      flash[:alert] = "You shall not pass! Please log in or register for an account"
      redirect_to root_path
    end
  end 

  def logged_in?
    !!current_user
  end 
end
