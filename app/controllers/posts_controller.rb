class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    render plain: params[:post].inspect
    #redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:title, :author_name, :photo_url)
  end
end