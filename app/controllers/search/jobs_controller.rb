class Search::JobsController < ApplicationController
  before_action :authorized

  def index
    @location = params[:location]
    @jobs = JobFacade.jobs_by_location(params[:location])
  end

end
