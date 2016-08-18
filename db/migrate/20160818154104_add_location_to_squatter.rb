class AddLocationToSquatter < ActiveRecord::Migration[5.0]
  def change
    add_column :squatters, :location, :text
  end
end
