class Composition < ApplicationRecord
  belongs_to :instrumental
  belongs_to :user
  belongs_to :memory_list
end
