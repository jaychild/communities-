class Location::FavouritePlacesController < LocationController
  def index

  end

  def create
    location = FavouritePlace.new(
        name: params[:favourite_place][:name],
        address_line: params[:favourite_place][:address_line],
        region: params[:favourite_place][:region],
        country: params[:favourite_place][:country],
        post_code: params[:favourite_place][:post_code]
    )
    if location.save
      flash[:notice] = 'Location added to your favourite places!'
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
