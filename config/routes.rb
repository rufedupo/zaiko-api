Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json }, path: "/" do
    mount_devise_token_auth_for 'User', at: 'auth'
  end
end
