class Widget < Flexirest::Base
  verbose!
  before_request do |_, request|
    request.headers['Authorization'] = Auth.current_user_token if Auth.current_user_token.present?
  end

  get :all, '/widgets'

  get :find, '/widgets/:id'

  get :visibles, '/widgets/visible', defaults: {
    client_id: ENV['CLIENT_ID'],
    client_secret: ENV['CLIENT_SECRET']
  }

  get :created_by_me, '/users/me/widgets', defaults: {
    client_id: ENV['CLIENT_ID'],
    client_secret: ENV['CLIENT_SECRET']
  }

  get :created_by_other, '/users/:id/widgets', defaults: {
    client_id: ENV['CLIENT_ID'],
    client_secret: ENV['CLIENT_SECRET']
  }

  post :save, '/widgets', defaults: {
    client_id: ENV['CLIENT_ID'],
    client_secret: ENV['CLIENT_SECRET']
  }

  put :update, '/widgets/:id'

  delete :destroy, '/widgets/:id'
end
