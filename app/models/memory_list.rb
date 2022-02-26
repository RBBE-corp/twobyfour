class MemoryList < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :compositions, dependent: :destroy
  has_many :memory_list_flashcards, dependent: :destroy
  has_many :flashcards, through: :memory_list_flashcards
  validates :name, presence: true, uniqueness: true

  def flashcards_not_in_memory_list
    Flashcard.all.reject { |object| flashcards.pluck(:id).include?(object.id) }
  end
end
