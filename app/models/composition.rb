class Composition < ApplicationRecord
  belongs_to :instrumental
  belongs_to :user
  validates :memory_list, presence: true
end
