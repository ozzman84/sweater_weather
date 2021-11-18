Rails.application.routes.draw do
  get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :backgrounds, only: :index
      resources :forecast, only: :index
      resources :activities, only: :index
      resources :breweries, only: :index
      resources :users, only: :create
      resources :sessions, only: :create
    end
  end
end
