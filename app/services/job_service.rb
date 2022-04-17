class JobService
  class << self

    def connection
      Faraday.new('http://localhost:5000/api/v1/')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def jobs_by_location(location)
      response = connection.get('jobs') do |faraday|
        faraday.params[:where] = location
      end
      parse_json(response)[:data]
    end
  end
end
