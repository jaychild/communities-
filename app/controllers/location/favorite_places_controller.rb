class Location::FavoritePlacesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :instantiate_google_service, only: [:new]
  before_action :all_favorite_places

  def index

  end

  def create
    location = FavoritePlace.new(
        name: params[:favorite_place][:name],
        address_line: params[:favorite_place][:address_line],
        region: params[:favorite_place][:region],
        country: params[:favorite_place][:country],
        post_code: params[:favorite_place][:post_code]
    )
    if location.save
      flash[:success] = 'Location added to your favorite places!'
    else
      flash[:error] = 'Oops, something went wrong'
    end
    redirect_to root_path
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

  def all_favorite_places
    @favorite_places = FavoritePlace.all
  end

end
