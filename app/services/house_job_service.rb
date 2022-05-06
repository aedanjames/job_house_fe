class HouseJobService
  class << self

    def connection
      Faraday.new(ENV['backend_url'])
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_house_jobs(mls_id)
      response = connection.get('houses/jobs') do |faraday|
        faraday.params[:api_house_id] = mls_id
      end
      parse_json(response)
    end
  end
end