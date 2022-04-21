class JobHouseService
  class << self
    def connection
      Faraday.new(url: ENV['backend_url'])
      # Faraday.new(url: 'https://gentle-beach-60003.herokuapp.com/')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_job_houses(job_id)
      response = connection.get("jobs/#{job_id}/houses") do |faraday|
      end
      parse_json(response)
    end
  end
end
