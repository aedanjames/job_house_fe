class House
  attr_reader :listing_price,
              :address,
              :contact,
              :api_house_id

  def initialize(data)
    @listing_price = data[:listPrice]
    @address = data[:address][:full]
    @contact = data[:agent][:contact][:email]
    @api_house_id = data[:mlsId]
  end
end 
