class UsersController < ApplicationController
  def profile
    @compositions = current_user.compositions
    @playlists = current_user.playlists
    @scores = current_user.scores.order(created_at: :desc)
  end
end
