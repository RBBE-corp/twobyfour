class MemoryListFlashcard < ApplicationRecord
  belongs_to :flashcard, dependent: :destroy
  belongs_to :memory_list, dependent: :destroy
end
