class JobService
  class << self

    def connection
      Faraday.new('http://localhost:5000/api/v1/')
      # Faraday.new(ENV['backend_url'])
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def jobs_by_location(location)
      response = connection.get('jobs') do |faraday|
        faraday.params[:where] = location
      end
      parse_json(response)
    end
  end

  def save_job(job, user_email)
    response = connection.post('jobs') do |faraday|
      faraday.params[:email] = user_email
      faraday.body(job.to_json)
    end
  end
end