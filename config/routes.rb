Rails.application.routes.draw do
  get 'invalid/not_found'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'visitors#index'

  get '/signup', to: 'visitors#new', as: 'signup'
  # if user manually types 'create' instead of 'signup' in url, it should redirect to appropriate link
  get '/create', to: redirect('/signup')
  post '/signup', to: 'visitors#create'

  get '/login', to: 'sessions#new', as: 'login'
  # if user manually types 'signin' instead of 'login' in url, it should redirect to appropriate link
  get '/signin', to: redirect('/login')
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # if a visitor manually types any url that isn't mentioned in routes it will show a specific page saying page not found
  get ':not_found', to: 'invalid#not_found', constraints: { not_found: /.*/ }

end
