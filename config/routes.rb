Rails.application.routes.draw do
  resources :books
  resources :users, param: :_username
  resources :checkouts, only: [:create, :update, :index]
  get 'search', to: 'books#search'

  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
