class CreateMemoryLists < ActiveRecord::Migration[6.1]
  def change
    create_table :memory_lists do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
