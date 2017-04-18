class CreateTravelPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_places do |t|
      t.string :name
      t.string :address
      t.string :description
      t.integer :cost
      t.string :avatar
      t.float :avg_rate, default: 0
      t.integer :status, default: 0
      t.references :category, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
