class ArticlesController < ApplicationController
  def index
    @article = Article.new
    @lists = List.all
    if params[:list]
      @active_list = List.find(params[:list])
      @active_list_shows = @active_list.shows
      @active_list_articles = []
      @active_list_shows.each { |show| @active_list_articles << show.article  }
      @active_list_articles
      @articles = @active_list_articles
    else
      @articles = Article.all
    end
  end

  def new
    @article = Article.new
  end

  def create
    @list = List.find(params[:list_id])
    @article = Article.new(article_params)
    if @article.save
      show = Show.create(article: @article, list: @list)
      redirect_to articles_path
    else
      redirect_to controller: 'articles', action: 'index'
    end
  end

  private

  def article_params
    params.require(:article).permit(:description, :photo)
  end

end
