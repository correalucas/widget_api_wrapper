class Auth < Flexirest::Base
  cattr_accessor :current_user_token
  base_url 'https://showoff-rails-react-production.herokuapp.com'

  before_request do |_, request|
    request.headers['Authorization'] = current_user_token if current_user_token.present?
  end

  post :authenticate, '/oauth/token', defaults: {
    grant_type: 'password',
    client_id: ENV['CLIENT_ID'],
    client_secret: ENV['CLIENT_SECRET']
  }

  post :refresh, '/oauth/token', defaults: {
    grant_type: 'refresh_token',
    client_id: ENV['CLIENT_ID'],
    client_secret: ENV['CLIENT_SECRET']
  }

  post :logout, '/oauth/revoke'
end
