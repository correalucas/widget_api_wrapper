class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user_token

  private

  # Check if authentication header is passed
  def authorize_request
    @current_user_token = AuthorizeApiRequest.new(request.headers).call[:bearer_token]
    Auth.current_user_token = @current_user_token
  end
end
