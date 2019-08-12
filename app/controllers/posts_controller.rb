class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
    # @posts = Post.all
  end

  def new
  end

  def edit
    @post =Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.save
    # render plain: params[:post].inspect
    redirect_to root_path
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :author_name, :photo_url)
  end
end