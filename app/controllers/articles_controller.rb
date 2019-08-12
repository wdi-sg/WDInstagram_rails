class ArticlesController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def edit
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
end