class Job
  attr_reader :id,
              :salary,
              :city,
              :state,
              :company,
              :contact

  def initialize(data)
    @id = data[:id]
    @salary = data[:attributes][:salary]
    @city = data[:attributes][:location][:city]
    @state = data[:attributes][:location][:state]
    @company = data[:attributes][:company]
    @contact = data[:attributes][:contact]
  end
end