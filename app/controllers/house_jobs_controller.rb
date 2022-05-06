class HouseJobsController < ApplicationController
  def index
    @jobs = HouseJobFacade.house_jobs(params[:mls_id])
  end

  def show
    if params[:commit] == "See Details"
      @job = JobFacade.single_job(job_params)
    end
  end

private
  def job_params
    params.permit(:id,:company,:contact,:salary,:state,:city,:title)
  end
end