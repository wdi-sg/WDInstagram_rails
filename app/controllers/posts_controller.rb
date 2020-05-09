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
  end

  def create
    @post = Post.new(post_params)

    @post.save
    redirect_to @post
  end

  def update
  end

  def destroy
  end

  private
    def post_params
      params.require(:post).permit(:title, :photo_url, :caption)
    end
end