require 'net/http'
class ExternalApi::Request

  def self.make_request(url, data)
    uri = URI(url + data)
    response = Net::HTTP.get_response(uri)
    # response.body
    JSON.parse(response.body)

  end

end