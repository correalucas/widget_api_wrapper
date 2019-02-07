Rails.application.routes.draw do
  # Auth routes
  post 'auth/login', to: 'authentication#authenticate'
  post 'auth/refresh', to: 'authentication#refresh_token'
  post 'auth/logout', to: 'authentication#logout'
end
