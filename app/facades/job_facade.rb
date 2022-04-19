class JobFacade
  class << self

    def jobs_by_location(location)
      jobs_json = JobService.jobs_by_location(location)
      jobs_json[:data].map do |job_data|
        Job.new(job_data)
      end
    end

    def single_job(params)
      job_data = {:id=> params[:id],
                  :attributes=>
                    {:salary=> params[:salary],
                      :location=> {:city=> params[:city], :state=> params[:state]},
                      :company=> params[:company],
                      :title=> params[:title],
                      :contact=> params[:contact]}}

          Job.new(job_data)
    end
  end

  def save_job

  end
end
