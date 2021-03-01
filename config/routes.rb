Rails.application.routes.draw do
  get 'home', to: 'home#index'

  namespace :api, format: 'json' do
    resources :memorys, only: [:index, :show, :create, :update, :destroy]
  end

  namespace :api, format: 'json' do
    resources :users, only: [:create]
  end
end
