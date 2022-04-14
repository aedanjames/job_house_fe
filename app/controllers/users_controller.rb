class UsersController < ApplicationController
  def authorize
    auth_hash = request.env['omniauth.auth']
    email = auth_hash[:info][:email]
    session[:access_token] = auth_hash[:credentials][:token]
    # UserFacade.find_or_create_user(email)
    redirect_to '/'
  end
end