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
      redirect_to memory_list_path(@memory_list)
    else
      render :new
    end
  end

  def show; end

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
