class Composition < ApplicationRecord
  belongs_to :instrumental
  belongs_to :user
  validates :memory_list, :instrumental_id, :user_id, presence: true
end
