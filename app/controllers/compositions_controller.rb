class CompositionsController < ApplicationController
  before_action :find_composition, only: [:show, :edit, :update, :destroy, :addrep]

    include SpeechApi

  def index
    @compositions = Composition.all
    @memory_list_flashcards = MemoryListFlashcard.all
  end

  def new
    @memory_list_flashcard = MemoryListFlashcard.new
    @flashcard = Flashcard.new
    @composition = Composition.new
    @memory_list = MemoryList.new
    @instrumentals = Instrumental.all
    @memory_lists = MemoryList.all
    # @memory_list = MemoryList.find(params[id])
  end

  def create
    @memory_lists = MemoryList.all
    @instrumentals = Instrumental.all
    @composition = Composition.new(composition_params)
    @composition.user = current_user
    @composition.rep_count = 0
    if @composition.save
      redirect_to composition_path(@composition)
    else
      render :new
    end
  end

  def show
    # @memory_list = MemoryList.find(params[:id])
  end

  def edit; end

  def update
    if @composition.update(composition_params)
      redirect_to composition_path, notice: "Composition created!"
    else
      render :edit
    end
  end

  def destroy
    @composition.destroy
    redirect_to profile_path, notice: "Composition deleted!"
  end


  def karaoke
    @composition = Composition.last
  end

  def checker
    puts params
    uploaded_file = params["files.file"]
    raw_string = uploaded_file.read
    puts raw_string
    # raise
    apple(raw_string)
  end

  def addrep
    @composition.increment!(:rep_count)
    respond_to do |format|
      format.json { render json: @composition.rep_count }
    end
  end

  private

  def composition_params
    params.require(:composition).permit(:name, :instrumental_id, :memory_list_id)
  end

  def find_composition
    @composition = Composition.find(params[:id])
  end
end
