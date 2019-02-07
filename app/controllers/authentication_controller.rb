class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  # return auth token once user is authenticated
  def authenticate
    auth_token = AuthenticateUser.new(auth_params[:username], auth_params[:password]).call
    json_response(auth_token)
  end

  # Refresh expired token
  def refresh_token
    auth_refresh = Auth.new(refresh_token: refresh_params[:refresh_token]).refresh
    json_response(auth_refresh.data.to_json)
  end

  # Logout authenticated user
  def logout
    user_logout = Auth.new(token: logout_params[:token]).logout
    json_response(user_logout.data.to_json)
  end

  private

  def auth_params
    params.permit(:username, :password)
  end

  def refresh_params
    params.permit(:refresh_token)
  end

  def logout_params
    params.permit(:token)
  end
end
