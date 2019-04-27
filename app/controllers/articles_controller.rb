class ArticlesController < ApplicationController

  def index
      @results = [];

      Article.all.each do |post|
        @results.push(post)
      end

    if params[:order] === nil || params[:order] =="des"
      puts "hello #{params}"
      puts @results
      @results = @results.sort_by {|result| result[:created_at]}.reverse
    elsif params[:sort] == "date" && params[:order] =="asc"
      @results
    end

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
    render plain: params[:article].inspect
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
    puts "hello"
  end

  # RAILS SECURITY FEATURE?
  private
  def article_params
    params.require(:article).permit(:author_name, :title, :photo_url, :caption)
  end
end