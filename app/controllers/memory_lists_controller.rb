class MemoryListsController < ApplicationController
  before_action :find_memory_list, only: [:show, :edit, :update, :destroy]

  def index
    @memory_lists = MemoryList.all
  end

  def new
    @memory_list = MemoryList.new
  end

  def create
    @memory_list = MemoryList.new(memory_list_params)
    @memory_list.user = current_user
    if @memory_list.save
      redirect_to new_composition_path(@memory_list)
      # redirect_to memory_list_path(@memory_list)
    else
      render :new
    end
  end

  # get the flashcards which are not already in the memory list - AR Query - define in the model
  # store in an instance variable so can access in the view
  # @flashcards.instancevar.each render a partial - pass instance into the partial
  # simple form to toggle selected or not (checkbox or otherwise)
  # check everything then click a button to add
  # remote: true form (JS get request) - in AJAX?
  def show
    @flashcards = Flashcard.all
    # @flashcards_not_selected = Flashcard.find_each do |flashcard|
    #   @memory_list.memory_list_flashcards.where.not(flashcard_id: flashcard.id)
    # end
    @flashcards_not_selected = @memory_list.flashcards_not_in_memory_list
    # raise
  end

  def edit; end

  def update
    if @memory_list.update(memory_list_params)
      redirect_to memory_list_path(@memory_list), notice: "Memory list created!"
    else
      render :edit
    end
  end

  def destroy
    @memory_list.destroy
    redirect_to memory_lists_path
  end

  private

  def memory_list_params
    params.require(:memory_list).permit(:name)
  end

  def find_memory_list
    @memory_list = MemoryList.find(params[:id])
  end
end
