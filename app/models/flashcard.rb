class Flashcard < ApplicationRecord
<<<<<<< HEAD

=======
  validates :english_word, presence: true, uniqueness: true
  validates :japanese_word, presence: true, uniqueness: true
  validates :category, presence: true
  has_many :memory_lists
>>>>>>> master
end
