class CreateFlashcards < ActiveRecord::Migration[6.1]
  def change
    create_table :flashcards do |t|
      t.string :english_word
      t.string :japanese_word
      t.string :category
      t.datetime :last_practiced

      t.timestamps
    end
  end
end
