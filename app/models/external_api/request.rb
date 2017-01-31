require 'net/http'
class ExternalApi::Request
  def self.make_request(url)
    uri = URI(url)
    Net::HTTP.get(uri)
  end
end