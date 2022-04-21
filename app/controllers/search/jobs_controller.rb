class Search::JobsController < ApplicationController
  before_action :authorized

  def index
    @location = params[:location]
    @jobs = JobFacade.jobs_by_location(params[:location])
  end

  def show
    if params[:commit] == "See Details"
      @job = JobFacade.single_job(job_params)
    end
  end

  def save
    job = JobFacade.single_job(job_params)
    JobService.save_job(job, session[:email])

    redirect_to dashboard_path
  end
private

  def job_params
    params.permit(:id,:company,:contact,:salary,:state,:city,:title)
  end
end
