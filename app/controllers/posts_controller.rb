class PostsController < ApplicationController
  def index
    @posts = Post.all
    # render plain: "Hello"
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def edit
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
  end

  def destroy
  end
end

private

def post_params
  params.require(:post).permit(:title, :author_name, :photo_url)
end
