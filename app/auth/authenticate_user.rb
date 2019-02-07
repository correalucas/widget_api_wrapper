class AuthenticateUser
  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    auth
  end

  private

  attr_reader :username, :password

  def auth
    auth_user = Auth.new(username: username, password: password)
    auth_user.data.to_json if auth_user.authenticate
  end
end
