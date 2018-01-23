Rails.application.routes.draw do
  resources :businesses, only: [:index, :show]
  resources :business_registrations, only: [:new, :create]
end
