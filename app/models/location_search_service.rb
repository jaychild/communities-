class LocationSearchService
  delegate :get_location_details, to: :location_api
  attr_accessor :location

  def initialize(location)
    @location = location
  end

  def google_the_location
    get_location_details(location)
  end


  private

  def location_api
    ExternalApi::GoogleServices::GeoLocation
  end
end