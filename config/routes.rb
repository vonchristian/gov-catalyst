Rails.application.routes.draw do
  resources :businesses, only: [:index, :show] do
    resources :fees, only: [:new, :create]
  end
  resources :business_registrations, only: [:new, :create]
  resources :business_trades, only: [:new, :create]
end
