class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.float :num_rate
      t.references :user, foreign_key: true
      t.references :travel_place, foreign_key: true

      t.timestamps
    end
  end
end
