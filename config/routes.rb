Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tourist_sights, only: [:index]
      resources :recipes, only: [:index]
      resources :learning_resources, only: [:index]
      resources :air_quality, only: [:index]
      resources :users, only: [:create]
      resources :favorites, only: [:create, :index]
    end
  end
end
