class CreateInstrumentals < ActiveRecord::Migration[6.1]
  def change
    create_table :instrumentals do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.float :duration
      t.integer :bpm

      t.timestamps
    end
  end
end
