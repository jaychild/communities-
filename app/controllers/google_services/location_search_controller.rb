class GoogleServices::LocationSearchController < LocationController
  before_action :instantiate_google_service, only: [:new]
  after_action :respond_with_js, only: [:new]

  def index

  end

  def new
    api_response = @location_search_service.google_the_location
    @favourite_place = FavouritePlace.new(
        address_line: api_response[:addr], region: api_response[:addr_region],
        country: api_response[:addr_country], post_code: api_response[:addr_postal_code]
    )
  end

  private

  def instantiate_google_service
    @location_search_service ||= LocationSearchService.new(params[:location_search_service][:location])
  end

  def respond_with_js
    respond_to do |format|
      format.html
      format.js
    end
  end
end
