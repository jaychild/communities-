class LocationController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :instantiate_google_service, only: [:new]
  before_action :all_favorite_places

  def all_favorite_places
    @favourite_places = FavouritePlace.all
  end
end
