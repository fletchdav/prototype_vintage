class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @lists = List.all
    @articles = policy_scope(Article).select{|article| article.shows.count > 0}
    @shootings = Shooting.all
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
    @list = List.find(params[:list_id]) if params[:list_id]
  end

  def create
    @list = List.find(params[:list_id])
    @article = Article.new(article_params)
    authorize @article
    if @article.save
      Show.create(article: @article, list: @list)
      colors_cropped
      redirect_to list_path(@list)
    else
      redirect_to list_path(@list)
    end
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
    @list = List.find(params[:list_id])
  end

  def update
    @article = Article.find(params[:id])
    authorize @article
    @list = List.find(params[:list_id])
    if @article.update(article_params)
      @article.save
      colors_cropped
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    list = List.find(params[:list_id])
    show = @article.shows.where(:list_id == params[:list_id])
    show.first.destroy
    redirect_to list_path(list)
  end

  private
  def article_params
    params.require(:article).permit(:size, :description, :photo)
  end

  def colors
    article = Article.last
    article.colors.destroy_all
    url = article.photo.url
    photo = Camalian::load(url)
    colors.each do |color|
      unless c = Color.where(r: color.r, g: color.g, b: color.b).first
        c = Color.create(r: color.r, g: color.g, b: color.b, h: color.h, s: color.s, l: color.l)
      end
      article.colors << c
    end
  end

  def colors_cropped
    article = Article.last
    article.colors.destroy_all
    url = article.photo.url(:color)
    photo = Camalian::load(url)
    colors = photo.prominent_colors(50).sort_similar_colors
    colors.each do |color|
      unless c = Color.where(r: color.r, g: color.g, b: color.b).first
        c = Color.create(r: color.r, g: color.g, b: color.b, h: color.h, s: color.s, l: color.l)
      end
      article.colors << c
    end
  end
end
