class AddAssignmentToScores < ActiveRecord::Migration[5.2]
  def change
    add_column :scores, :assignment, :string
  end
end
