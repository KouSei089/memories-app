Rails.application.routes.draw do
  get 'home', to: 'home#index'

  namespace :api, format: 'json' do
    resources :memorys, only: [:index, :create, :update]
  end
end
