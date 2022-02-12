class CreateMemoryListFlashcards < ActiveRecord::Migration[6.1]
  def change
    create_table :memory_list_flashcards do |t|
      t.references :flashcard, null: false, foreign_key: true
      t.references :memory_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
