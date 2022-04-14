class Job 
  attr_reader :id, :company, :salary, :location, :contact

  def initialize(data)
    @id = data[:id]
    @company = data[:attributes][:company]
    @salary = data[:attributes][:salary]
    @location = data[:attributes][:location]
    @contact = data[:attributes][:contact]
  end 
end 