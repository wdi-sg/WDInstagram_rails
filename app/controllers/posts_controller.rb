
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
    p post_params
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def update
    @post = Post.find(params[:id])

    @post.update(post_params)
    redirect_to @post
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :username, :photo_url)
  end
end
