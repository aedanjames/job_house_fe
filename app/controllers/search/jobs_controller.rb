class Search::JobsController < ApplicationController
  before_action :authorized

  def index
    @location = params[:location]
    @jobs = JobFacade.jobs_by_location(params[:location])
    # require "pry"; binding.pry
  end

  def show
    if params[:commit] == "See Details"
      @job = JobFacade.single_job(job_params)
      # require "pry"; binding.pry
    end
  end

  def save
    job = JobFacade.single_job(job_params)
    JobService.save_job(job, session[:email])
    redirect_to dashboard_path
    # JobFacade.<<method that triggers JobService API call to BE. Put job in body of request>>
  end
private

  def job_params
    params.permit(:id,:company,:contact,:salary,:state,:city,:title)
  end
end
