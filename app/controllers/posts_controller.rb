class PostsController < ApplicationController
  def index
    if (params[:sort_by] == "asc")
      @posts = Post.all.order(created_at: :asc)
    elsif (params[:sort_by] == "desc")
      @posts = Post.all.order(created_at: :desc)
    else
      @posts = Post.all
    end
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
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

private
  def post_params
    params.require(:post).permit(:author_name, :photo_url, :title, :caption)
  end

end