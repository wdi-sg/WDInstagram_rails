# require 'byebug'

class ArticlesController < ApplicationController
  before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    @articles = Article.all
    @articles = Article.order('created_at DESC')

    if params.has_key?(:article_id)

      # get all the rangers for a specific park
      @comments = Comment.where(article_id: params[:article_id])
    else
      # get all rangers
      @comments = Comment.all


    end

    @hashtags = Hashtag.all

  end


  def show
    @article = Article.find(params[:id])

    @hashtags = Hashtag.all

  end


  def edit
    @article = Article.find(params[:id])
  end

  def create

    # render plain: params[:article].inspect

    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end


  def new

  end

  def update
    @article = Article.find(params[:id])

    @article.update(article_params)
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end


  private
  def article_params
    params.require(:article).permit(:title, :post, :author, :photo_url, :date_taken, :hashtag_ids => [] )
  end


end