Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
      namespace :v1 do
        resources :validation_codes, only: [:create]
        resources :sessions, only: [:create, :destroy]
        resources :me, only: [:show]
        resources :items
        resources :tags
      end
  end
end
