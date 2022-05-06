class HouseFacade
  class << self

    def get_houses(job_id)
      houses_json = JobHouseService.get_job_houses(job_id)
      houses_json[:data].map do |house_data|
        House.new(house_data)
      end
    end

    def house_index(location, max_price)
      houses_json = HouseService.get_houses(location, max_price)
      houses_json[:data].map do |house_data|
        House.new(house_data)
      end
    end

    def saved_houses(user_email)
      houses_json = HouseService.get_saved_houses(user_email)
      houses_json[:data].map do |house_data|
        House.new(house_data)
      end 
    end
  end
end