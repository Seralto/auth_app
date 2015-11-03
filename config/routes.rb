Rails.application.routes.draw do
  root to: 'home#index'

  resources :users
  get 'signup' => 'users#new'
end
