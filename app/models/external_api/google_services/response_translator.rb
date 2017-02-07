class ExternalApi::GoogleServices::ResponseTranslator
  COLLECTION = "results"
  ADDR_KEY = "address_components"
  ATTR_KEY = "short_name"
  TYPE_KEY = "types"

  def initialize(api_response)
    @api_response = api_response
  end

  def format_response
    address = []
    administrative_area = []
    country, postal_code = ''

    api_response.dig(COLLECTION).first.dig(ADDR_KEY).each do |component|
      address_line = component.dig(ATTR_KEY)
      address << address_line if address?(component.dig(TYPE_KEY))
      administrative_area << address_line if region?(component.dig(TYPE_KEY))
      country = address_line if country?(component.dig(TYPE_KEY))
      postal_code = address_line if postal_code?(component.dig(TYPE_KEY))
    end

    {
        addr: address.join(', '), addr_region: administrative_area.join(', '),
        addr_country: country, addr_postal_code: postal_code
    }
  end

  private
  attr_reader :api_response

  def address?(type)
    (postal_code?(type) || country?(type) || region?(type)) ? false : true
  end

  def postal_code?(type)
    type.include? 'postal_code'
  end

  def country?(type)
    type.include? 'country'
  end

  def region?(type)
    type.include?('administrative_area_level_1') || type.include?('administrative_area_level_2')
  end
end