class GoogleService < ApplicationRecord
  GEO_KEY = 'geo_loc'

  def self.geo_code_url
    GoogleService.where(key: GEO_KEY).pluck(:url).first
  end
end
