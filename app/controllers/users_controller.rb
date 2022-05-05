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
    session[:user_id] = @user.id
    @jobs = JobFacade.format_jobs(@user.jobs)
    @houses = HouseFacade.saved_houses(session[:email])
  end

  def logout
    session.destroy
    redirect_to root_path
  end

  def email_realtor
    RealtorMailer.email_realtor(params[:realtor_contact], params[:mls_id], session[:email]).deliver
    redirect_to dashboard_path
  end
end