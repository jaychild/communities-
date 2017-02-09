class FavouritePlace < ApplicationRecord
  validates_presence_of :name, :address_line, :region, :post_code, :country

end
