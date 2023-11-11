Rails.application.routes.draw do
  root 'home#index'

  resources :carts, only: %i[new create]
end
