class PostsController < ApplicationController

  def index
    #@posts = Article.all
  end

  def show
     #@article = Article.find(params[:id])
  end

  def new

  end

  def edit
    #@article=Article.find(params[:id])
  end

  def create
    #render plain: params[:article].inspect

    #@article = Article.new(article_params)

    #@article.save
    #redirect_to @article

  end

  def update
    #@article = Article.find(params[:id])

    #@article.update(article_params)
    #redirect_to @article
  end


  def destroy

  end

end