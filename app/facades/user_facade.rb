class UserFacade
  class << self

    def retrieve_user(email)
      User.new(UserService.send_user_email(email))
    end
  end
end