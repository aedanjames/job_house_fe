require 'rails_helper'

RSpec.describe JobFacade do

  it 'creates a job when given a job id', :vcr do
    job = JobFacade.get_job(1)
    expect(job).to be_an_instance_of(Job)
    expect(job.city).to be_a(String)
    expect(job.company).to be_a(String)
    expect(job.contact).to be_a(String)
    expect(job.id.to_i).to be_an(Integer)
    expect(job.salary).to be_an(Integer)
    expect(job.state).to be_an(String)
    expect(job.title).to be_an(String)
  end

  it 'creates job poros for job search by location', :vcr do
    jobs = JobFacade.jobs_by_location('california')
    expect(jobs).to be_an(Array)
    jobs.each do |job|
      expect(job).to be_an_instance_of(Job)
    end
  end

  it 'creates single job poro given params', :vcr do
    params = {
      :id => 1,
      :salary => 10000000,
      :city => 'denver',
      :state => 'colorado',
      :title => 'software engineer',
      :contact => 'jobs@jobs.com',
    }

    job = JobFacade.single_job(params)

    expect(job).to be_an_instance_of(Job)
  end

  it '.format_jobs', :vcr do
    jobs = [
      {
        :id => 1,
        :salary => 100,
        :location => {:city => 'denver', :state => 'colorado'},
        :company => 'turing',
        :title => 'software dev',
        :contact => 'email@email.com'
      },
      {
        :id => 1,
        :salary => 100,
        :location => {:city => 'denver', :state => 'colorado'},
        :company => 'turing',
        :title => 'software dev',
        :contact => 'email@email.com'
      }
    ]

    job_poros = JobFacade.format_jobs(jobs)

    job_poros.each do |job|
      expect(job).to be_an_instance_of(Job)
    end
  end
end
