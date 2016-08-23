class AddSizeToAbode < ActiveRecord::Migration[5.0]
  def change
    add_column :abodes, :sleeps_number, :integer
  end
end
