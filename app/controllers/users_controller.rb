class UsersController < ApplicationController
  def profile
    @compositions = current_user.compositions
    @playlists = current_user.playlists
    @scores = current_user.scores.order(created_at: :desc)

    # first 3 memorylists and memorylists associate with current user
    @memory_lists = MemoryList.first(3).concat current_user.memory_lists
    
    # least reps
    @composition = current_user.compositions&.first
    # sum of compo score  s by day
    @data = Composition.where(user: current_user).joins(:scores).group_by_day('compositions.created_at').sum('scores.score')
    # average score
    @average_score = current_user.scores.average(:score)
    @average_score = 0 if @average_score.nil?
  end
end
