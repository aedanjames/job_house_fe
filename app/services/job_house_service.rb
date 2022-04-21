class JobHouseService
  class << self
    def connection
      Faraday.new(url: ENV['backend_url'])
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_job_houses(job_id)
      response = connection.get("jobs/#{job_id}/houses") do |faraday|
      end
      parse_json(response)
    end

    def save_house(job_id, house_mls_id, user_email)
      response = connection.post("jobs/houses") do |faraday|
        faraday.params[:mls_id] = house_mls_id
        faraday.params[:job_id] = job_id
        faraday.params[:email] = user_email
      end
    end 
  end
end
