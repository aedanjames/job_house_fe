class Search::JobsController < ApplicationController
  before_action :authorized, except: [:index, :show, :job_params]

  def index
    @location = params[:location]
    if  params[:location].present? && params[:what].present? && params[:salary_min].present?
      @jobs = JobFacade.jobs_by_location(params[:location], params[:what], params[:salary_min])
    elsif params[:salary_min].empty? && params[:what].present?
      @jobs = JobFacade.jobs_by_location(params[:location], params[:what])
    elsif params[:salary_min].present? && params[:what].empty?
      @jobs = JobFacade.jobs_by_location(params[:location], params[:salary_min])
    else 
      @jobs = JobFacade.jobs_by_location(params[:location])
    end
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
