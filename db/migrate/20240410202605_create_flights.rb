class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.string :name
      t.time :depart_time
      t.decimal :flight_duration
      t.integer :origin_airport_id
      t.integer :destination_airport_id
      t.date :depart_date

      t.timestamps
    end
    add_foreign_key :flights, :airports, column: :origin_airport_id
    add_foreign_key :flights, :airports, column: :destination_airport_id
  end
end
