class Composition < ApplicationRecord
  validates :name, presence: true
  belongs_to :instrumental
  belongs_to :user
  belongs_to :memory_list
end
