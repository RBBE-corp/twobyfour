class PlaylistComposition < ApplicationRecord
  belongs_to :composition
  belongs_to :playlist
<<<<<<< HEAD
  validates :composition_id, presence: true
  validates :playlist_id, presence: true
=======
>>>>>>> master
end
