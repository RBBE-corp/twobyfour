class Composition < ApplicationRecord
  belongs_to :instrumental
  belongs_to :user
  has_many :scores, dependent: :destroy
  has_many :playlist_entries, dependent: :destroy
  belongs_to :memory_list
end
