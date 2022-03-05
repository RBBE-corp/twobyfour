class MemoryListsController < ApplicationController
  before_action :find_memory_list, only: [:show, :edit, :update, :destroy]

  def index
    @memory_lists = MemoryList.all
  end

  def new
    @flashcard = Flashcard.new
    @composition = Composition.new
    @memory_list = MemoryList.new
    @memory_lists = MemoryList.all
  end

  def create
    @memory_lists = MemoryList.all
    @memory_list = MemoryList.new(memory_list_params)
    @memory_list.user = current_user
    if @memory_list.save
      redirect_to memory_lists_path
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
    # hide everything not in the selected category
  end

  def edit; end

  # def update
  #   # raise
  #   if @memory_list.update(memory_list_params)
  #     redirect_to memory_list_path(@memory_list), notice: "Memory list created!"
  #   else
  #     render :edit
  #   end
  # end

  def update
    puts params
    if params["FlashcardID"].present?
      flashcard_sorting
    else
      if @memory_list.update(memory_list_params)
        redirect_to memory_list_path(@memory_list), notice: "Memory list created!"
      else
        render :edit
      end
    end
  end

  def flashcard_sorting
    arr = JSON.parse(params["FlashcardID"])
    puts arr.first.to_i.class
    new_arr = [];
    # taking the array and changing the string to integer
    arr.each { |string| new_arr << string.to_i}
    puts new_arr.first.class
    puts "not working"
    # creating all the ids of the flashcards - not required? default rails convention?
    flashcard = @memory_list.flashcard_ids
    new_arr.each do |new_id|
      unless flashcard.include? new_id
        MemoryListFlashcard.create(
          memory_list: @memory_list,
          flashcard: Flashcard.find(new_id)
        )
      end
    end
    removed_flashcards = (flashcard - new_arr)
    puts "----------------------------------------------"
    puts "removed flashcards - #{removed_flashcards}"
    removed_flashcards.each do |removed_flashcard|
      # MemoryListFlashcard.where(memory_list: @memory_list).where(flashcard: Flashcard.find(removed_flashcard))
      memory_list_flashcard = MemoryListFlashcard.where(["memory_list_id = ?  AND flashcard_id = ?", @memory_list.id, removed_flashcard])
      puts memory_list_flashcard.first.id
      memory_list_flashcard.first.destroy
    end
    # ball.destroy
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
