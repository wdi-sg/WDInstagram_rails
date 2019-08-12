class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  def update
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:author_name, :photo_url, :title)
  end

end