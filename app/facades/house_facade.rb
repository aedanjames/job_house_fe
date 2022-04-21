class HouseFacade
  class << self

    def get_houses(job_id)
      houses_json = JobHouseService.get_job_houses(job_id)
      houses_json[:data].map do |house_data|
        House.new(house_data)
      end
    end
  end
end