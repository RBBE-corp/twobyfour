class MemoryListFlashcard < ApplicationRecord
  belongs_to :flashcard
  belongs_to :memory_list
end
