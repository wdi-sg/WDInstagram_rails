class PostsController < ApplicationController
  def index
    @posts = Post.all
    @sort = params[:sort]
        if @sort=='date_desc'
          @posts = Post.order(created_at: :desc)
        elsif @sort=='date_asc'
          @posts = Post.order(created_at: :asc)
        elsif @sort=='author_asc'
          @posts = Post.order(author_name: :asc)
        elsif @sort=='author_desc'
          @posts = Post.order(author_name: :desc)
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

end

private
  def post_params
    params.require(:post).permit(:title, :author_name, :photo_url)
  end