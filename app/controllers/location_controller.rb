class LocationController < ApplicationController


  def instantiate_google_service
    @location_search_service ||= LocationSearchService.new(params[:location])
  end

  def all_favorite_places
    @favorite_places = FavoritePlace.all
  end
end
