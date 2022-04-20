require 'rails_helper'

RSpec.describe 'JobHouseService' do
  describe 'class methods' do
    xit '.jobs_by_location', :vcr do
      json_response = JobHouseService.jobs_by_location("colorado", "new york")
    end
  end
end
