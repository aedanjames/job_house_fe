require 'rails_helper'

RSpec.describe 'Job Search Spec' do

  it 'is able to search for jobs based on state and city' do
    visit '/search/jobs'

    fill_in('search'), with: ''
  end
end
