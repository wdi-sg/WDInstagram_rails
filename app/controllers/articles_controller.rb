class ArticlesController < ApplicationController
  def index
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
      @article = Article.find(params[:id])

  @article.update(article_params)
  redirect_to @article
  end

  def destroy
      @article = Article.find(params[:id])
  @article.destroy

  redirect_to root_path
  end
end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end