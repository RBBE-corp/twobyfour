class Composition < ApplicationRecord
  validates :name, presence: true
  belongs_to :instrumental
  belongs_to :user
  has_many :scores
  validates :memory_list, presence: true
end
