class JobHouseFacade
  class << self

    def saved_job_houses(job_id, user_email)
      json = JobHouseService.get_saved_job_houses(job_id, user_email)
      result = json[:data].map do |house_data|
        House.new(house_data)
      end
      return result
    end
  end
end