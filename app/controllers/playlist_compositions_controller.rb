class PlaylistCompositionsController < ApplicationController
  def new
    @playlist = Playlist.find(params[:playlist_id])
    @playlist_composition = PlaylistComposition.new
  end

  def create
  playlist = Playlist.find(params[:playlist_composition][:playlist_id])
  if PlaylistComposition.create(composition_params)
    redirect_to playlist
  else
    render :new
  end
  end

  def destroy
    @playlist_composition = PlaylistComposition.find(params[:id])
    @playlist_composition.destroy
  end

  private

  def composition_params
    params.require(:playlist_composition).permit(:playlist_id, :composition_id)
  end
end
