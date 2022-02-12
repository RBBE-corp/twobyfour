class ScoreController < ApplicationController
  before_action :find_score, only: [:show, :update]

  def new
    @score = Score.new
  end

  def create
    @score = Score.new(score_params)
    @score.user = current_user
    @score.save
  end

  def update
    if @score.update(score_parms)
      redirect_to score_path, notice: "Score for composition updated!"
    else
      render :edit
    end
  end

  private

  def score_params
    params.require(:score).permit(:score)
  end

  def find_score
    @score = Score.find(params[:id])
  end
end
