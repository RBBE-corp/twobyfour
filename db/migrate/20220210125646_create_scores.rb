class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.integer :score
      t.references :composition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
