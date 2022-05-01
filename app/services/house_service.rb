class HouseService
  class << self

    def connection
      Faraday.new(ENV['backend_url'])
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_houses(location, max_price)
      response = connection.get('houses') do |faraday|
        faraday.params[:where] = location
        faraday.params[:max_price] = max_price.to_i * 100
      end
      parse_json(response)
    end
  end
end