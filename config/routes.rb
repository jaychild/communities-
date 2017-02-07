Rails.application.routes.draw do
  namespace :location do
    resources :favorite_places
  end

  namespace :google_services do
    resources :location_search
  end

  root to: 'location/favorite_places#index'

end
