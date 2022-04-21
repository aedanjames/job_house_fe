require 'rails_helper'

RSpec.describe JobService do
  describe 'class methods' do

    it 'lists jobs based on a given location param by the user', :vcr do
      jobs = JobService.jobs_by_location('93003')
      expect(jobs).to be_a(Hash)
      expect(jobs).to have_key(:data)
      expect(jobs[:data].count).to eq(50)

      jobs[:data].each do |job|
        expect(job).to have_key(:id)
        expect(job).to have_key(:type)
        expect(job).to have_key(:attributes)
        expect(job[:attributes]).to have_key(:salary)
        expect(job[:attributes]).to have_key(:location)
        expect(job[:attributes][:location]).to have_key(:city)
        expect(job[:attributes][:location]).to have_key(:state)
        expect(job[:attributes]).to have_key(:id)
        expect(job[:attributes]).to have_key(:company)
        expect(job[:attributes]).to have_key(:contact)
      end
    end

    it 'saves jobs to databse', :vcr do
      data = {
          :id => '1',
          :attributes => {
            :company => "Twilio",
            :salary => "100",
            :location => {city: 'denver', state: 'colorado'},
            :contact => "emailaddress@email.com",
            :title => 'Software Developer'
          }
        }

      job1 = Job.new(data)
      expect(job1).to be_a(Job)
    end

    it '.get_job', :vcr do
      job_data = JobService.get_job(1)
      
      expect(job_data).to be_a(Hash)
      expect(job_data).to have_key(:data)
      expect(job_data[:data]).to have_key(:id)
      expect(job_data[:data]).to have_key(:type)
      expect(job_data[:data]).to have_key(:attributes)
      expect(job_data[:data][:attributes]).to have_key(:salary)
      expect(job_data[:data][:attributes]).to have_key(:location)
      expect(job_data[:data][:attributes]).to have_key(:id)
      expect(job_data[:data][:attributes]).to have_key(:company)
      expect(job_data[:data][:attributes]).to have_key(:contact)
    end
  end
end
