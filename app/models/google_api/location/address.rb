require 'net/http'
class GoogleApi::Location::Address

  def initialize(location)

  end

  # search for location in google API
  def self.get_address_on(*args)
    url = GoogleService.geo_code_url + args.join('+')
    make_request(url)
  end

  private

  def self.make_request(url)
    uri = URI(url)
    Net::HTTP.get(uri)
  end

end