Rails.application.routes.draw do
  namespace :location do
    resources :favorite_places
  end

  root to: 'location/favorite_places#index'

end
