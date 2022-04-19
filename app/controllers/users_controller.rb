class UsersController < ApplicationController
  before_action :authorized, except: [:authorize]

  def authorize
    auth_hash = request.env['omniauth.auth']
    email = auth_hash[:info][:email]
    session[:access_token] = auth_hash[:credentials][:token]
    session[:email] = email
    redirect_to dashboard_path
  end

  def index
    @user = UserFacade.retrieve_user(session[:email])
    @jobs = @user.jobs
  end

  def logout
    session.destroy
    redirect_to root_path
  end
end
