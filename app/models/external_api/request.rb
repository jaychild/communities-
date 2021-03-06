require 'net/http'
class ExternalApi::Request

  def self.make_request(url, data)
    data = data || ''
    uri = URI(url + data)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  rescue
    {'status' => 'could not establish connection to api.'}
  end
end