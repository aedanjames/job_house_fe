class JobHouseController < ApplicationController
  def show
    @houses = HouseFacade.get_houses(params[:id])
    @job = JobFacade.get_job(params[:id])
  end
end