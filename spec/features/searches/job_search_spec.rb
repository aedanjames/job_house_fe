require 'rails_helper'

RSpec.describe 'Job Search Spec' do

  xit 'is able to search for jobs based on state and city', :vcr do
    visit '/'
    click_link('Search for Jobs')
    expect(current_path).to eq('search/jobs')
  end
end
