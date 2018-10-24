class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
    @tags = @post.tags

  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      @post.save
      redirect_to @post
    else
      render 'new'
    end

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
    redirect_to 'index'
  end

  private

  def post_params
    params.require(:post).permit(:author, :photo_url, :caption, :date_taken)
  end
end