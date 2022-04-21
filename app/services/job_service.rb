class JobService
  class << self

    def connection
      Faraday.new(ENV['backend_url'])
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

    def save_job(job, user_email)
      response = connection.post('jobs') do |faraday|
        faraday.params[:email] = user_email
        faraday.params[:job] = job.to_json
      end
    end

    def get_job(job_id)
      response = connection.get("jobs/#{job_id}") do |faraday|
      end
      parse_json(response)
    end

    def delete_job(job_id, user_id)
      response = connection.delete("user/jobs/#{job_id}") do |faraday|
        faraday.params[:user_id] = user_id
      end
    end 
  end
end