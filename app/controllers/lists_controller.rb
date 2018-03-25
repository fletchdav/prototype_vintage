class ListsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @lists = List.all
    @special_lists = List.where(is_special: true)
    @list = List.find(params[:id])
    authorize @list
    @list_articles = []
    @list.shows.each { |show| @list_articles << show.article }
    @article = Article.new
    @shootings = Shooting.all || []
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = List.new(list_params)
    authorize @list
    if @list.save
      redirect_to list_path(@list)
    else
      redirect_to new_list_path #pas possible
    end
  end

    def update
    @list = List.find(params[:id])
    authorize @list
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:id])
    authorize @list
    @list.destroy
    redirect_to root_path
  end

  private
  def list_params
    params.require(:list).permit(:title, :is_special)
  end

end
