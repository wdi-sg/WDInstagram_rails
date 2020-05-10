class InstagramController < ApplicationController
  def index
    # @instagram = Instagram.all
  end

# def show
#   @article = Article.find(params[:id])
end

  def new
  end

  def edit
  end

  def create
    render plain: params[:instagram].inspect
  # @article = Article.new(article_params)

  # @article.save
  # redirect_to @article
  end

  def update
  end

  def destroy
  end

  # private
  #   def article_params
  #     # params.require(:article).permit(:title, :text)
  #   end
# end