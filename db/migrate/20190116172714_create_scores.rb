class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.string :email
      t.string :name
      t.integer :week
      t.integer :total_test
      t.integer :passed_test
      t.float :total_score
      t.timestamps
    end
  end
end
