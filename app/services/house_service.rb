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
        faraday.params[:max_price] = max_price
      end
      parse_json(response)
    end

    def save_house(user_email, mls_id)
      response = connection.post('houses') do |faraday|
        faraday.params[:email] = user_email
        faraday.params[:mls_id] = mls_id
      end
    end

    def get_saved_houses(user_email)
      response = connection.get('users/houses') do |faraday|
        faraday.params[:email] = user_email
      end
      parse_json(response)
    end

    def delete_house(user_email, mls_id)
      response = connection.delete('users/houses') do |faraday|
        faraday.params[:email] = user_email
        faraday.params[:mls_id] = mls_id
      end
    end
  end
end