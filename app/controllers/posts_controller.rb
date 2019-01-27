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
    @post = Post.find(params[:id])

  end

  def create
    @post = Post.new(post_params)

    @post.save
    redirect_to action:"show", id:@post.id
  end

  def update
    @post = Article.find(params[:id])

    @post.update(post_params)
    redirect_to @post
  end

  def destroy

  end

  private
    def post_params
      params.require(:post).permit(:author_name, :photo_url)
    end

end