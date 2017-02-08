class ExternalApi::GoogleServices::GeoLocation

  # search for location in google API
  def self.get_location_details(*args)
    url = ExternalApi::GoogleService.geo_code_url
    location = construct_location_string(args)
    response = make_request(url, location)
    response(response)
  end

  def self.construct_location_string(location_parts)
    location_parts.join('+')
  end

  def self.response(response)
    return {status: response['status']} unless response['status'] == 'OK'
    translator = ExternalApi::GoogleServices::GeoLocationResponseTranslator.new(response)
    translator.format_response
  end

  class << self
    delegate :make_request, to: ExternalApi::Request
  end
end