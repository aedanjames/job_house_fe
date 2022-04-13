class JobhouseService
  class << self
    def connection
      Faraday.new(url: 'https://gentle-beach-60003.herokuapp.com/')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def jobs_by_city(city)
      response = connection.get("search/jobs") do |faraday|
        faraday.params['city'] = city
      end
      parse_json(response)
    end
  end
end
