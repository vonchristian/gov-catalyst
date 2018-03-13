Rails.application.routes.draw do

  devise_for :users
  unauthenticated :taxpayer do
    root :to => 'landing_page#index',  as: :unauthenticated_taxpayer_root
  end
  root :to => 'taxpayers/businesses#index', :constraints => lambda { |request| request.env['warden'].user.present? }, as: :taxpayer_root
  devise_for :taxpayers, :controllers => { :invitations => 'taxpayers/invitations', confirmations: 'taxpayers/confirmations', sessions: 'taxpayers/sessions' }
  resources :businesses, only: [:index, :show] do
    resources :fees, only: [:new, :create]
  end
  resources :business_permit_applications, only: [:new, :create]

  resources :taxpayer_sign_ups, only: [:new, :create], module: :taxpayers
  resources :taxpayers, only: [:show] do
    resources :business_permit_applications, only: [:new, :create], module: :taxpayers
  end
  namespace :configurations do
    resources :business_trades, only: [:new, :create]
    resources :fees, only: [:new, :create]
    resources :taxes, only: [:new, :create]
  end

end
