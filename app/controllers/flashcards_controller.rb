class FlashcardsController < ApplicationController
  before_action :find_flashcard, only: :show
  # before_action :find_memory_list, only: [:index, :show]

  def index
    @flashcards = Flashcard.all
  end

  def new
    @flashcard = Flashcard.new
  end

  def create
    @flashcard = Flashcard.new(flashcard)
    # @flashcard.memory_list = MemoryList.find(params["flashcard"]["memory_list_ids"].last.to_i)
    if @flashcard.save
      memory_list = MemoryList.find(params["flashcard"]["memory_list_ids"].last.to_i)
      MemoryListFlashcard.create!(flashcard: @flashcard, memory_list: memory_list)
      # redirect_to flashcard(@flashcard)
      redirect_to new_composition_path
    # else
    #   redirect_to new_composition_path(@flashcard)
    end
  end

  def show; end

  # def edit; end

  # def update
  #   if @flashcard.update(flashcard)
  #     redirect_to flashcard, notice: "flashcard created!"
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @flashcard.destroy
  end

  private

  def flashcard
    params.require(:flashcard).permit(:english_word, :japanese_word, :category)
  end

  def find_flashcard
    @flashcard = Flashcard.find(params[:id])
  end
end
