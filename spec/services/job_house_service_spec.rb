require 'rails_helper'

RSpec.describe 'JobhouseService' do
  describe 'class methods' do
    it '.jobs_by_city' do
      json_response = File.read('spec/fixtures/job_by_city_results.json')
      binding.pry
      json_jobs = stub_request(:get, "https://gentle-beach-60003.herokuapp.com/search/jobs/city?=new+york").with(
        headers: {'User-Agent' => 'Faraday v2.2.0'}
      ).to_return(status: 200, body: json_response, headers: {})


    end
  end
end
