class SearchController < ApplicationController
  def search_for_jobs
    # Not functional yet, need to dig into what the issue is more. 
    JobFacade.jobs_by_location(params[:location])
  end
end