class Flashcard < ApplicationRecord
  validates :english_word, presence: true
  validates :japanese_word, presence: true
  validates :category, presence: true
  has_many :memory_list_flashcards, dependent: :destroy
  has_many :memory_lists, through: :memory_list_flashcards
end
