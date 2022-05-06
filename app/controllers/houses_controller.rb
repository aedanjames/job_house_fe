class HousesController < ApplicationController
  before_action :authorized, except: [:index, :show]

  def save
    HouseService.save_house(session[:email], params[:mls_id])
    redirect_to dashboard_path
  end

  def destroy
    HouseService.delete_house(session[:email], params[:mls_id])
    redirect_to dashboard_path
  end 
end