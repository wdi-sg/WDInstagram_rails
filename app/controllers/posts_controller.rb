class PostsController < ApplicationController
  def index
    @posts = Post.all
    # render plain: "Hello"
  end

  def show
    @post = Post.find(params[:id])
    puts "INSPECT HERE"
  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    foo = post_params
    puts foo.inspect
    @post = Post.new(post_params)

    @post.save
    # redirect_to ("/")
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
  params.require(:post).permit(:title, :author_name, :photo_url, :caption)
end
