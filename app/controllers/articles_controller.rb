class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @lists = List.all
    @articles = policy_scope(Article)
      .select{ |article| article.shows.count > 0 }
      .sort_by { |article| article.position }
    i = 1
    @articles.each do |article|
      article.position = i
      article.save
      i +=1
    end
    @shootings = Shooting.all
    @sorted_colors = sorted_colors(@articles)
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


  def up
    @article = Article.find(params[:id])
    authorize @article
    article_to_downgrade = Article.find_by(position: @article.position - 1)
    @article.position -= 1
    article_to_downgrade.position += 1
    @article.save
    article_to_downgrade.save
    redirect_to articles_path
  end

    def down
    @article = Article.find(params[:id])
    authorize @article
    article_to_upgrade = Article.find_by(position: @article.position + 1)
    @article.position += 1
    article_to_upgrade.position -= 1
    @article.save
    article_to_upgrade.save
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:chosen_color, :description, :photo)
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
    colors = photo.prominent_colors(20).sort_similar_colors
    colors.each do |color|
      unless c = Color.where(r: color.r, g: color.g, b: color.b).first
        c = Color.create(r: color.r, g: color.g, b: color.b, h: color.h, s: color.s, l: color.l)
      end
      article.colors << c
    end
  end

  def sorted_colors(articles)
    colors = []
    articles.each {|article| colors << article.article_color_rgb if article.article_color_rgb}
    camalian_colors = colors.map{|color| Camalian::Color.new(color.r,color.g,color.b)}
    camalian_palette_sorted = Camalian::Palette.new(camalian_colors).sort_similar_colors
    sorted_colors = []
    camalian_palette_sorted.each do |color|
      color = Color.where(r: color.r, g: color.g, b: color.b, h: color.h, s: color.s, l: color.l).first
      sorted_colors << color.to_hex
    end
    sorted_colors.uniq
  end
end
