class Composition < ApplicationRecord
  validates :memory_list_id, :instrumental_id, presence: true
  validates :rep_count, numericality: true
  belongs_to :instrumental
  belongs_to :user
  has_many :scores, dependent: :destroy
  has_many :playlist_compositions, dependent: :destroy
  belongs_to :memory_list
  has_many :scores, dependent: :destroy
  validates :name, uniqueness: {  scope: :user }

  # getting all the flascards
  has_many :flashcards, through: :memory_list
end
