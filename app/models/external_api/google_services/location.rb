class ExternalApi::GoogleServices::Location

  # search for location in google API
  def self.get_location_details(*args)
    # url = GoogleService.geo_code_url + args.join('+')
    # make_request(url)

    url = GoogleService.geo_code_url
    response = make_request(url, args.join('+'))

    translator = ExternalApi::GoogleServices::ResponseTranslator.new(response)
    translator.format_response
  end

  class << self
    delegate :make_request, to: ExternalApi::Request
  end
end