
class PostsController < ApplicationController

before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    @posts = Post.all
    @hashtags = Hashtag.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @hashtags = Hashtag.all
  end

  def update
    @post = Post.find(params[:id])

    if(@post.update(post_params))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def new
    @post = Post.new
    @hashtags = Hashtag.all
  end

  def create
    #render plain: params["post"].inspect

    @post = Post.new(post_params)
    if (@post.save)
    redirect_to @post

  else
    render 'new'
    end

  end

  def destroy
    @post = Post.find(params[:id])
    # @comment = @post.comments.find(params[:id])
    # @comment.destroy
    @post.destroy

    redirect_to posts_path
  end





private def post_params
  params.require(:post).permit(:title, :url, :description, hashtag_ids: [])
end

end

