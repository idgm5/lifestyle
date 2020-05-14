Rails.application.routes.draw do
  get 'sign_in', action: :sign_in, controller: 'users'
  post 'login', action: :login, controller: 'users'
  delete 'log_out', action: :destroy, controller: 'users'

  resources :users
  resources :articles

  root 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
