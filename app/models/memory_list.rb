class MemoryList < ApplicationRecord
  belongs_to :user
  has_many :compositions, dependent: :destroy
  has_many :memory_list_flashcards
  has_many :flashcards, through: :memory_list_flashcards
  validates :name, presence: true, uniqueness: true
end
