class CreateAbodeImages < ActiveRecord::Migration[5.0]
  def change
    create_table :abode_images do |t|
      t.references :abode
      t.string :file_name

      t.timestamps
    end
  end
end
