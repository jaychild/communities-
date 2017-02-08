class Location::FavoritePlacesController < LocationController
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
      flash[:notice] = 'Location added to your favorite places!'
    else
      flash[:error] = "Error: #{location.errors.full_messages.join(', ')}"
    end
    redirect_to root_path
  end

  private

  def instantiate_google_service
    @location_search_service ||= LocationSearchService.new(params[:location])
  end
end
