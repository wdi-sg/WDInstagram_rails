class PostsController < ApplicationController
  def index
    @posts = Post.all().order("created_at DESC")
    p request.query_parameters[:sort]
    if request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "asc"
      @posts = Post.all().order("created_at ASC")
    elsif request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "desc"
      @posts = Post.all().order("created_at DESC")
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    # p post_params
    @post = Post.new(post_params)
    p to_param
    @post.save
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
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
    params.require(:post).permit(:author, :photo_url, :title, :caption)
  end

end