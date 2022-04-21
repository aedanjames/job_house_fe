class JobFacade
  class << self

    def get_job(job_id)
      yay = JobService.get_job(job_id)
      split = yay[:data][:attributes][:location].split(',')
      hash = {
      city: split[0],
      state: split[1]
    }
      job_data = {:id=> yay[:data][:id],
        :attributes=>
          {:salary=> yay[:data][:attributes][:salary],
            :location=> hash,
            :company=> yay[:data][:attributes][:company],
            :title=> yay[:data][:attributes][:title],
            :contact=> yay[:data][:attributes][:contact]}}

      Job.new(job_data)
    end

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

    def format_jobs(jobs)
      jobs.map do |job_data|
        formatted_job_data = {:id=> job_data[:id],
                                :attributes=> 
                                  {:salary=> job_data[:salary],
                                    :location=> {:city=> job_data[:location][:city], :state=> job_data[:location][:state]},
                                    :company=> job_data[:company],
                                    :title=> job_data[:title],
                                    :contact=> job_data[:contact]}}

        Job.new(formatted_job_data)
      end 
    end 
  end
end
