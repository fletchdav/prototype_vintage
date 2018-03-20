class ArticlesController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @article = Article.new(article_params)
    if @article.save
      Show.create(article: @article, list: @list)
      redirect_to list_path(@list)
    else
      redirect_to list_path(@list)
    end
  end

  def destroy
    article = Article.find(params[:id])
    list = List.find(params[:list_id])
    show = article.shows.where(:list_id == params[:list_id])
    show.first.destroy
    redirect_to list_path(list)
  end

  private
  def article_params
    params.require(:article).permit(:description, :photo)
  end
end
