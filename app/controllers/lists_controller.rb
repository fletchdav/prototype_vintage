class ListsController < ApplicationController
    skip_before_action :authenticate_user!, only: :show

  def show
    @lists = List.all
    @list = List.find(params[:id])
    @list_articles = []
    @list.shows.each { |show| @list_articles << show.article }
    @article = Article.new
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      redirect_to new_list_path #pas possible
    end
  end

    def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  private
  def list_params
    params.require(:list).permit(:title)
  end

end
