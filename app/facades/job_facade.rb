class JobFacade
  class << self

    def jobs_by_location(location)
      jobs_json = JobService.jobs_by_location(location)

      jobs_json.map do |job_data|
        Job.new(job_data)
      end
    end
  end
end
