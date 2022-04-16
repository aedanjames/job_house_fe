class UsersController < ApplicationController
  before_action :authorized, except: [:authorize]

  def authorize
    auth_hash = request.env['omniauth.auth']
    email = auth_hash[:info][:email]
    user = UserFacade.find_or_create_user(email)
    session[:access_token] = auth_hash[:credentials][:token]
    session[:user] = user
    redirect_to dashboard_path
  end

  def index
    @user_email = session[:user].values[1]
  end

  def logout
    session.destroy
    redirect_to root_path
  end 
end