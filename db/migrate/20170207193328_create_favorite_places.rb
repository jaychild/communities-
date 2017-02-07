class CreateFavoritePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_places do |t|
      t.string :name
      t.string :address_line
      t.string :region
      t.string :country
      t.string :post_code

      t.timestamps
    end
  end
end
