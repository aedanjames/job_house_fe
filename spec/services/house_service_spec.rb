require 'rails_helper'

RSpec.describe 'HouseService' do
  describe 'class methods' do
    it '.get_houses', :vcr do
      houses_json = HouseService.get_houses("Texas", "1000000")
      expect(houses_json[:data]).to be_an(Array)
      houses_json[:data].each do |house|
        expect(house[:id]).to be_an(String)
        expect(house[:type]).to be_an(String)
        expect(house[:attributes]).to be_an(Hash)
        expect(house[:attributes][:id]).to be_an(Integer)
        expect(house[:attributes][:list_price]).to be_an(Integer)
        expect(house[:attributes][:address]).to be_an(String)
        expect(house[:attributes][:contact]).to be_an(String)
        expect(house[:attributes][:api_house_id]).to be_an(Integer)
        expect(house[:attributes][:bedrooms]).to be_an(Integer)
        expect(house[:attributes][:half_baths]).to be_an(Integer)
        expect(house[:attributes][:full_baths]).to be_an(Integer)
        expect(house[:attributes][:view]).to be_an(String)
        expect(house[:attributes][:year_built]).to be_an(Integer)
        expect(house[:attributes][:photos]).to be_an(Array)
        expect(house[:attributes][:photos][0]).to be_an(String)
      end
    end
  end
end