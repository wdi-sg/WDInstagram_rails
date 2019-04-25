class PostsController < ApplicationController
  def index

    if request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "desc"
      @posts = Post.order(created_at: :desc)
    else
      @posts = Post.all
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    @post = Post.new(post_params)

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
    params.require(:post).permit(:author_name, :photo_url, :title, :caption, :created_at)
  end

end