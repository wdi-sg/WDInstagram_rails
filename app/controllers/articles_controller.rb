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
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  def sort
    @argument = request.params["order"]
    if @argument == "desc"
      @articles = Article.all.order('created_at DESC')
      render 'index.html.erb'
    else
      @articles = Article.all.order('created_at ASC')
      render 'index.html.erb'
    end
  end

  def lol
    render plain: request.params
  end
end

private
  def article_params
    params.require(:article).permit(:title, :author_name, :photo_url, :caption  )
  end