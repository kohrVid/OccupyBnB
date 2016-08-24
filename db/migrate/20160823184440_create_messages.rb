class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :body
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :replied_to_id
      t.boolean :read, default: false
      t.boolean :visible, default: true

      t.timestamps
    end
  end
end
