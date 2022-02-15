class PlaylistComposition < ApplicationRecord
  belongs_to :composition
  belongs_to :playlist
  validates :composition_id, presence: true
  validates :playlist_id, presence: true
end
