require 'rails_helper'

RSpec.describe UserFacade do

  # xit 'creates user poro', :vcr do
  #   user = UserFacade.find_or_create_user('email@email.com')
  #   expect(user).to be_an(User)
  #   expect(user.email).to be_an(String)
  #   expect(user.id).to be_an(String)
  #   expect(user.jobs).to be_an(Array)
  # end

  describe 'class methods' do
    it '.retrieve_user', :vcr do
      email = 'eturambi95@gmail.com'

      user = UserFacade.retrieve_user(email)

      expect(user).to be_a(User)
      expect(user.email).to be_a(String)
      expect(user.id.to_i).to be_an(Integer)
      expect(user.jobs).to be_an(Array)
    end
  end
end
