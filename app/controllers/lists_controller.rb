class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to articles_path
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

end
