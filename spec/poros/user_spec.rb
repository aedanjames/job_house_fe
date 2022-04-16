require "rails_helper"

RSpec.describe User do
  it "exists with attributes" do
    data = { "id":"1",
              "type":"user",
              "attributes":{"email":"email@email.com"},
              "relationships":{"jobs":{"data":[]}}}

    user = User.new(data)

    expect(user).to be_an_instance_of(User)
    expect(user.id).to eq('1')
    expect(user.email).to eq('email@email.com')
  end
end