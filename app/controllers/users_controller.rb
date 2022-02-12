class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :profile ]

  def profile
    @compositions = current_user.compositions
    @playlists = current_user.playlists
  end
end
