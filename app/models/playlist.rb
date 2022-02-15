class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_compositions
  has_many :compositions, through: :playlist_compositions
  validates :name, presence: true, uniqueness: true
end
