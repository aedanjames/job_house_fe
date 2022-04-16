class UsersController < ApplicationController
  def authorize
    auth_hash = request.env['omniauth.auth']
    email = auth_hash[:info][:email]
    user = UserFacade.find_or_create_user(email)
    session[:access_token] = auth_hash[:credentials][:token]
    session[:user] = user
    binding.pry
    redirect_to root_path
  end
end