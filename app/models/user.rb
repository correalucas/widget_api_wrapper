class User < Flexirest::Base
  before_request do |_, request|
    request.headers['Authorization'] = Auth.current_user_token if Auth.current_user_token.present?
  end

  get :find, '/users/:id'

  get :find_me, '/users/me'

  put :update, '/users/me'

  post :save, '/users', defaults: {
    client_id: ENV['CLIENT_ID'],
    client_secret: ENV['CLIENT_SECRET']
  }

  post :change_password, '/users/me/password'

  get :check_email, '/users/email', defaults: {
    client_id: ENV['CLIENT_ID'],
    client_secret: ENV['CLIENT_SECRET']
  }

  post :reset_password, '/users/reset_password', defaults: {
    client_id: ENV['CLIENT_ID'],
    client_secret: ENV['CLIENT_SECRET']
  }
end
