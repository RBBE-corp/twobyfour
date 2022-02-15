class Composition < ApplicationRecord
  validates :name, presence: true
  belongs_to :instrumental
  belongs_to :user
  belongs_to :memory_list

  has_many :scores
end
