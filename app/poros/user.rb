class User
  attr_reader :id,
              :email,
              :jobs

  def initialize(data)
    @id = data[:id]
    @email = data[:attributes][:email]
    @jobs = data[:attributes][:jobs]
  end
end
