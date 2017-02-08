class ExternalApi::GoogleService < ApplicationRecord
  GEO_KEY = 'geo_loc'

  def self.geo_code_url
    self.where(key: GEO_KEY).pluck(:url).first
  end
end
