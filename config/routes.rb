Rails.application.routes.draw do

  unauthenticated :taxpayer do
    root :to => 'landing_page#index',  as: :unauthenticated_taxpayer_root
  end

  devise_for :taxpayers, :controllers => { :invitations => 'taxpayers/invitations', confirmations: 'taxpayers/confirmations' }
  resources :businesses, only: [:index, :show] do
    resources :fees, only: [:new, :create]
  end
  resources :business_permit_applications, only: [:new, :create]
  resources :business_trades, only: [:new, :create]

  resources :taxpayer_sign_ups, only: [:new, :create], module: :taxpayers
  resources :taxpayers, only: [:show] do
    resources :business_permit_applications, only: [:new, :create], module: :taxpayers
  end
end
