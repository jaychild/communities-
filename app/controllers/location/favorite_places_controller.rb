class Location::FavoritePlacesController < ApplicationController
  before_action :instantiate_google_service, only: [:new]

  def index

  end

  def create

  end

  def new
    # raise @location_search_service.inspect
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  private

  def instantiate_google_service
    @location_search_service ||= LocationSearchService.new(params[:location])
  end

end
