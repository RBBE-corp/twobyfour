class PlaylistCompositionController < ApplicationController
  def new
    @playlist_composition = Playlist_Composition.new
  end

  def create
    @playlist_composition = Playlist_Composition.new(params[:playlist_id])
    @playlist_composition = Playlist_Composition.save
  end

  def destroy
    @playlist_composition = Playlist_Composition.find(params[:id])
    @playlist_composition.destroy
  end
end
