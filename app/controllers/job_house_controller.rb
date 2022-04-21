class JobHouseController < ApplicationController
  def show
    @houses = HouseFacade.get_houses(params[:id])
    @job = JobFacade.get_job(params[:id])
  end

  def destroy
    JobService.delete_job(params[:id], session[:user_id])
    redirect_to dashboard_path
  end 

  def save_house
    JobHouseService.save_house(params[:job_id], params[:house_id], session[:email])
    redirect_to dashboard_path
  end
end