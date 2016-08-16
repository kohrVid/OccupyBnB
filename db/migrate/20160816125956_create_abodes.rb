class CreateAbodes < ActiveRecord::Migration[5.0]
  def change
    create_table :abodes do |t|
      t.string :title
      t.boolean :residential, default: false
      t.text :location
      t.text :description
      t.decimal :latitude, scale: 14, precision: 20
      t.decimal :longitude, scale: 14, precision: 20
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
