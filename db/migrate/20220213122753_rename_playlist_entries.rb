class RenamePlaylistEntries < ActiveRecord::Migration[6.1]
  def change
    rename_table :playlist_entries, :playlist_compositions
  end
end
