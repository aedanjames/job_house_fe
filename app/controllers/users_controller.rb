class UsersController < ApplicationController
  before_action :authorized, except: [:authorize]

  def authorize
    auth_hash = request.env['omniauth.auth']
    email = auth_hash[:info][:email]
    user = UserFacade.retrieve_user(email)
    session[:access_token] = auth_hash[:credentials][:token]
    # sessions only store basic datatypes (not poro)
    # implement caching instead cache the response and set expiration(time based)
    # view specific caching?
    session[:user] = user
    # @instance_variable ||= method
    redirect_to dashboard_path
  end

  def index
    @user_email = session[:user].values[1]
    @user_jobs = session[:user].values[2]
  end

  def logout
    session.destroy
    redirect_to root_path
  end
end