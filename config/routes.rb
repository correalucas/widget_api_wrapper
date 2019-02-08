Rails.application.routes.draw do
  # Auth routes
  post 'auth/login',   to: 'authentication#authenticate'
  post 'auth/refresh', to: 'authentication#refresh_token'
  post 'auth/logout',  to: 'authentication#logout'

  # User routes
  post 'signup',          to: 'users#create'
  post 'change_password', to: 'users#change_password'
  get  'check_email',     to: 'users#check_email'
  post 'reset_password',  to: 'users#reset_password'
  get  'my_profile',      to: 'users#my_profile'
  put  'my_profile',      to: 'users#update'
  get  'users/:id',       to: 'users#show'

  # Widget routes
  get    'widgets',           to: 'widgets#index'
  get    'widgets/visible',   to: 'widgets#visibles'
  get    'my_widgets',        to: 'widgets#my_widgets'
  get    'users/:id/widgets', to: 'widgets#user_widgets'
  post   'widgets',           to: 'widgets#create'
  put    'widgets/:id',       to: 'widgets#update'
  delete 'widgets/:id',       to: 'widgets#destroy'
end
