class PlaylistsController < ApplicationController
  before_action :find_playlist, only: [:show, :edit, :update, :destroy]

  def index
    @playlists = Playlist.all
  end

  def show; end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
  end

  def edit; end

  def update
    if @playlist.update(playlist_params)
      redirect_to playlist_path
    else
      render :edit
    end
  end

  def destroy
    @playlist.destroy
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end
end
