class MemoryListFlashcard < ApplicationRecord
  belongs_to :flashcard
  belongs_to :memory_list
  validates :flashcard_id, presence: true
  validates :memory_list_id, presence: true
end
