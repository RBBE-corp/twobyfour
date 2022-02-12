class PlaylistEntrysController < ApplicationController
  def new
    @playlist_entry = Playlist_Entry.new
  end

  def create
    @playlist_entry = Playlist_Entry.new(params[:playlist_id])
    @playlist_entry = Playlist_Entry.save
  end

  def destroy
    @playlist_entry = Playlist_Entry.find(params[:id])
    @playlist_entry.destroy
  end
end
