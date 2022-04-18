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
    job = JobFacade.single_job(job_params).to_json
    # JobFacade.<<method that triggers JobService API call to BE. Put job in body of request>>
  end
private 

  def job_params
    params.permit(:id,:company,:contact,:salary,:state,:city)
  end
end
