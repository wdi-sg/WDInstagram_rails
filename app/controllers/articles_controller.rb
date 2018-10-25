class ArticlesController < ApplicationController

  before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    @articles = Article.all
  end


  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      @article.save
      redirect_to @article
    else render 'new'
    end
  end


  def show
    @article = Article.find(params[:id])
    @comments = Comment.where("article_id=?", params[:id])
    @hashtags = Hashtag.all
  end


  def edit
    @article = Article.find(params[:id])
    if @article.user != current_user
      redirect_to articles_path
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    if @article.user != current_user
      redirect_to @article
    end

    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.user != current_user
      redirect_to articles_path
    elsif @article.user == current_user
      @article.destroy
      redirect_to articles_path
    end
  end

  private
  def article_params
    params.require(:article).permit(:author, :photo_url, :caption, :date_taken, :hashtag_ids => [])
  end

end
