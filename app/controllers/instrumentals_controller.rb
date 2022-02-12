class InstrumentalsController < ApplicationController
  before_action :set_instrumental, only: [:show, :destroy]

  def index
    @instrumentals = Instrumental.all
  end

  def show
  end

  def new
    @instrumental = Instrumental.new
  end

  def create
    @instrumental = Instrumental.new(instrumental_params)
    @instrumental.save
    redirect_to instrumentals_path
  end

  def destroy
  	@instrumental.destroy
  	redirect_to instrumentals_path
  end

  private

  def set_instrumental
    @instrumental = Instrumental.find(params[:id])
  end

  def instrumental_params
    params.require(:instrumental).permit(:title, :artist, :genre)
  end
end
