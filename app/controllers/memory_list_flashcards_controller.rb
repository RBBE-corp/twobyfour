class MemoryListFlashcardsController < ApplicationController
  def new
    @memory_list = Memory_list.find(params[:memory_list_id])
    @memory_list_flashcard = Memory_list_flashcard.new
  end

  # def create
  # playlist = Playlist.find(params[:playlist_composition][:playlist_id])
  # if PlaylistComposition.create(composition_params)
  #   redirect_to playlist
  # else
  #   render :new
  # end

  def create
    @memory_list = MemoryList.find(params[:memory_list_flashcard][:memory_list_id])
    @memory_list_flashcard = MemoryListFlashcard.new(memory_list_flashcard_params)
    @memory_list_flashcard.user = current_user
    if @memory_list_flashcard.save
      redirect_to memory_list_flashcard_path(@memory_list_flashcard)
    else
      render :new
    end
  end

  def destroy
    @memory_list_flashcard = Memory_list_flashcard.find(params[:id])
    @memory_list_flashcard.destroy
    redirect_to memory_list_flashcards
  end

  private

  def memory_list_flashcard_params
    params.require(:memory_list_flashcard).permit(:memory_list_id, :flashcard_id)
  end
end