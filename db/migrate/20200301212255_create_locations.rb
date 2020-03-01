class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :lat
      t.string :long

      t.timestamps
    end
  end
end
