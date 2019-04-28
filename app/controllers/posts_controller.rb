class PostsController < ApplicationController

  def index
    @posts = Post.all
    @posts = Post.order(created_at: :desc)
    @videos = Video.all
    @videos = Video.order(created_at: :desc)
  end

  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
    # @comments = Post.joins(:comments).where(author_name = Post.find(author_name = :author_name))
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