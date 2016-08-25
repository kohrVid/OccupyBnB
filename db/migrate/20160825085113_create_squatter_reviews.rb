class CreateSquatterReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :squatter_reviews do |t|
      t.integer :reviewee_id
      t.integer :reviewer_id
      t.string :summary
      t.text :body

      t.timestamps
    end
  end
end
