require 'rails_helper'

RSpec.describe 'JobHouseService' do
  describe 'class methods' do
    it '.get_job_houses', :vcr do
      houses_json = JobHouseService.get_job_houses(2)
    end
  end
end
