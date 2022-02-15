class Composition < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :rep_count, numericality: true
  belongs_to :instrumental
  belongs_to :user
  belongs_to :memory_list
  has_many :scores, dependent: :destroy
end
