class AddManagerIdToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :manager_id, :integer
  end
end
