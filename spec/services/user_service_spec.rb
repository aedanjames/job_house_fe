require 'rails_helper'

RSpec.describe UserService do
  describe 'class methods' do

    it 'sends an email to the BE, and recieves user data', :vcr do
      user = UserService.send_user_email('email@email.com')
      expect(user).to be_a(Hash)
      expect(user[:id]).to be_a(String)
      expect(user[:attributes][:email]).to be_a(String)
      expect(user[:relationships][:jobs][:data]).to be_a(Array)
    end
  end
end
