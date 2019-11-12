Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json }, path: "/" do
    mount_devise_token_auth_for 'User', at: 'auth'

    resources :products, only: [:index, :show, :create, :update, :destroy]
    resources :operations, only: [:index, :show, :create, :update, :destroy]
    resources :trades, only: [:index, :show, :create, :update, :destroy]
    resources :stocks, only: [:index, :show]
  end
end
