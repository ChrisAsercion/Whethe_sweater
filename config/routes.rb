Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v0 do
      get 'forecast', to: 'forecasts#show'
      post 'users', to: 'users#create'
      post 'sessions', to: 'sessions#create'
      post 'road_trip', to: 'roadtrips#show'
    end
    namespace :v1 do
      get 'book-search', to: 'books#show'
    end
  end
end
