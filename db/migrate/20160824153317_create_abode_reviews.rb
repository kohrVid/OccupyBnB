class CreateAbodeReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :abode_reviews do |t|
      t.references :squatter
      t.references :abode
      t.string :summary
      t.text :body

      t.timestamps
    end
  end
end
