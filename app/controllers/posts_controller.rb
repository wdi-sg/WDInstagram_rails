class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
     @post = Post.find(params[:id])
  end

  def new

  end

  def edit
    #@article=Article.find(params[:id])
  end

  def create
    #render plain: params[:post].inspect
    @post = Post.new(post_params)

    @post.save
    redirect_to @post

  end

  def update
    #@article = Article.find(params[:id])

    #@article.update(article_params)
    #redirect_to @article
  end


  def destroy

  end

  private
  def post_params
    params.require(:post).permit(:title, :author_name, :img_url)
  end

end