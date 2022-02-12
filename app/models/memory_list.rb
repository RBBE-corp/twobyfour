class MemoryList < ApplicationRecord
  belongs_to :user
  has_many :compositions
end
