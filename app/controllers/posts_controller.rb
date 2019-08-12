class PostsController < ApplicationController

  def index
    @posts = Post.all.order_list(params[:sort])
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

    @post.destroy()
    redirect_to posts_path
  end


  private
  def post_params
    params.require(:post).permit(:title, :author_name, :img_url, :caption)
  end

end