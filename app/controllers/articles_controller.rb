class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    # There should actually be a rendering command here
    # But it isn't necessary because in the absence of the rendering command,
    # Rails will automatically render views/articles/show

  end

  def new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
  # forms will always be a POST
  # Rails has designated shortcuts for common routes
  # e.g. articles_path will refer to "/articles POST"
  # For more information, get a routing error and see the err msg

  # render plain: params.inspect

  @article = Article.new(article_params)

  @article.save

  # Why does it redirect to 'articles/:id'
  # Ans: Just a rails shortcut, you are redirecting to a particulra instance stored in the variable
  # There are many shortcuts in Rails, which are created to streamline the coding process

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

private
  def article_params
    params.require(:article).permit(:author_name, :photo_url, :title)
  end
end