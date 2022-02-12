class Score < ApplicationRecord
  belongs_to :composition
  validates :score, :playlist_id, presence: true
end
