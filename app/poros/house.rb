class House
  attr_reader :listing_price,
              :address,
              :city_state,
              :contact,
              :photos,
              :bedrooms, 
              :half_baths,
              :full_baths,
              :view,
              :year_built,
              :mls_id


  def initialize(data)
    @mls_id = data[:id]
    @listing_price = data[:attributes][:list_price]
    @address = "#{data[:attributes][:address]} #{data[:attributes][:city]}, #{data[:attributes][:state]}"
    @city_state = "#{data[:attributes][:city]}, #{data[:attributes][:state]}"
    @contact = data[:attributes][:contact]
    @bedrooms = data[:attributes][:bedrooms]
    @half_baths = data[:attributes][:half_baths]
    @full_baths = data[:attributes][:full_baths]
    @view = data[:attributes][:view]
    @year_built = data[:attributes][:year_built]
    @photos = data[:attributes][:photos]
  end
end