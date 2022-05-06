class HouseJobFacade
  class << self

    def house_jobs(mls_id)
      json = HouseJobService.get_house_jobs(mls_id)
      result = json[:data].map do |job_data|
        Job.new(job_data)
      end
      return result
    end
  end
end