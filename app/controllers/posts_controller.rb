class PostsController < ApplicationController
  def index
    @posts = Post.all
    @type = "updated_at"
    @posts = Post.all.order("#{@type} #{params[:order]}").all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if(@post.save)
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def show
    @post = Post.find(params[:id])
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
    params.require(:post).permit(:author_name, :photo_url, :title, :caption)
  end
  
end
