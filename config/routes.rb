Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tourist_sights, only: [:index]
      resources :recipes, only: [:index]
      resources :learning_resources, only: [:index]
      resources :air_quality, only: [:index]
    end
  end
end
