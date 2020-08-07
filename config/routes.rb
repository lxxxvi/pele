Rails.application.routes.draw do
  root to: 'home#index'

  resources :matches
  resources :teams
  resources :venues, only: :index
end
