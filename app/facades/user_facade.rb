class UserFacade
  class << self

    def find_or_create_user(email)
      User.new(UserService.send_user_email(email))
    end
  end
end