Rails.application.routes.draw do
  namespace :location do
    resources :favourite_places
  end

  namespace :google_services do
    resources :location_search do
      post :create, on: :collection
    end
  end

  root to: 'location/favourite_places#index'

end
