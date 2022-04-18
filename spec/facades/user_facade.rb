require 'rails_helper'

RSpec.describe UserFacade do

  it 'creates user poro', :vcr do
    user = UserFacade.find_or_create_user('email@email.com')
    expect(user).to be_an(User)
    expect(user.email).to be_an(String)
    expect(user.id).to be_an(String)
    expect(user.jobs).to be_an(Array)

    
  end
end