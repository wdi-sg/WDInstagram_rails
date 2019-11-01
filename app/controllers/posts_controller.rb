class PostsController < ApplicationController

  def index
    @post = Post.all
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
    redirect_to @post

  end

  def update
  end

  def destroy
  end


  private
    def post_params
      params.require(:post).permit(:author_name, :photo_url, :title, :caption)
    end


end