require 'rails_helper'

RSpec.describe JobFacade do

  it 'creates job poros for job search by location', :vcr do
    jobs = JobFacade.jobs_by_location('california')

    expect(jobs).to be_an(Array)
    jobs.each do |job|
      expect(job).to be_an_instance_of(Job)
    end
  end
end
