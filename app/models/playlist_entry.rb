class PlaylistEntry < ApplicationRecord
  belongs_to :composition
  belongs_to :playlist
end
