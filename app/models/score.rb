class Score < ApplicationRecord
  belongs_to :composition
  validates :score, presence: true
end
