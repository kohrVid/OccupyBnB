class AddTypeToSquatters < ActiveRecord::Migration[5.0]
  def change
    add_column :squatters, :type, :string
  end
end
