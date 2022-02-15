class MemoryListsController < ApplicationController
  before_action :find_memory_list, only: [:show, :edit, :update, :destroy]

  def index
    @memory_lists = Memory_list.all
  end

  def new
    @memory_list = Memory_list.new
  end

  def create
    @memory_list = Memory_list.new(memory_list_params)
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
      redirect_to memory_list_path, notice: "Memory list created!"
    else
      render :edit
    end
  end

  def destroy
    @memory_list.destroy
  end

  private

  def memory_list_params
    params.require(:memory_list).permit(:name)
  end

  def find_memory_list
    @memory_list = Memory_list.find(params[:id])
  end
end
