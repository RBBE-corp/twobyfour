class CreateCompositions < ActiveRecord::Migration[6.1]
  def change
    create_table :compositions do |t|
      t.text :memory_list, array: true, default: []
      t.references :instrumental, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :rep_count

      t.timestamps
    end
  end
end
