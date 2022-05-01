require 'rails_helper'

RSpec.describe HouseFacade do

  it 'returns an array of houses when given location and max_price', :vcr do
    houses = HouseFacade.house_index("Texas", "400000")
    expect(houses.first).to be_an_instance_of(House)
    expect(houses).to be_a Array
    houses.each do |house|
      expect(house.address).to be_a String
      expect(house.bedrooms).to be_a Integer
      expect(house.contact).to be_a String
      expect(house.full_baths).to be_a Integer
      expect(house.half_baths).to be_a Integer
      expect(house.listing_price).to be_a Integer
      expect(house.photos).to be_a Array
    end 

  end
end