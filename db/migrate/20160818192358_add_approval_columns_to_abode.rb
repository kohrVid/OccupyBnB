class AddApprovalColumnsToAbode < ActiveRecord::Migration[5.0]
  def change
    add_reference :abodes, :submitted_by, references: :squatters
    add_reference :abodes, :approved_by, references: :admins
    add_column :abodes, :approved_at, :datetime
  end
end
