class AddFuriganaToFlashcards < ActiveRecord::Migration[6.1]
  def change
    add_column :flashcards, :furigana, :string
  end
end
