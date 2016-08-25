class AddCoordinatesToSquatter < ActiveRecord::Migration[5.0]
  def change
    add_column :squatters, :latitude, :decimal, scale: 14, precision: 20
    add_column :squatters, :longitude, :decimal, scale: 14, precision: 20
  end
end
