require "rails_helper"

RSpec.describe Job do
  it "exists with attributes" do
    data = {
      :id => '1',
      :attributes => { 
        :company => "Twilio",
        :salary => "100",
        :location => "Denver",
        :contact => "emailaddress@email.com"
      }
    }

    job = Job.new(data)

    expect(job).to be_an_instance_of(Job)
    expect(job.id).to eq('1')
    expect(job.company).to eq('Twilio')
    expect(job.salary).to eq('100')
    expect(job.location).to eq('Denver')
    expect(job.contact).to eq('emailaddress@email.com')
  end
end
