class UsersController < ApplicationController

  def profile
    @compositions = current_user.compositions
    @playlists = current_user.playlists
  end
end
