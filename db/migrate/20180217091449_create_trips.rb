class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :travel_mode
      t.decimal :ticket_cost
      t.decimal :home_cab_cost
      t.decimal :destination_cab_cost
      t.decimal :hotel_cost
      t.string :local_transport
      t.timestamps
    end
  end
end
