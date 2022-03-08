class UsersController < ApplicationController
  def profile
    @compositions = current_user.compositions
    @playlists = current_user.playlists
    @scores = current_user.scores.order(created_at: :desc)
    @memory_lists = current_user.memory_lists
    @composition = Composition.order(rep_count: :asc).first
  end
end
