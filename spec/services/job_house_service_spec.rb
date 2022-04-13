require 'rails_helper'

RSpec.describe 'JobHouseService' do
  describe 'class methods' do
    it '.jobs_by_city' do
      json_response = File.read('spec/fixtures/job_by_city_results.json')

      stub_request(:get, "https://gentle-beach-60003.herokuapp.com/search/jobs?city=new%20york").
      with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.2.0'
          }).
          to_return(status: 200, body: json_response, headers: {})

      search = JobHouseService.jobs_by_city("new york")
      expect(search).to be_a(Array)
    end
  end
end