Rails.application.routes.draw do
  root to: 'home#index'

  resources :users
  get 'signup' => 'users#new'
  get 'signin' => 'users#signin'

  post 'signin' => 'users#login'
  get 'logout' => 'users#logout'
end
