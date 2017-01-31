class CreateGoogleServices < ActiveRecord::Migration[5.0]
  def change
    create_table :google_services do |t|
      t.string :name
      t.string :url
      t.string :key

      t.timestamps
    end
  end
end
