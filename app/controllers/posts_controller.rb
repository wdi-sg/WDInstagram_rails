class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @tags = Tag.all
    @post = Post.new
  end

  def create
    # render plain: params[:post].inspect
    @post = Post.new(post_params)

    @post.save
    redirect_to @post
  end

  def edit
    @tags = Tag.all
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
    redirect_to posts_path
  end

  # this is tell ruby what is permited to be inputed into req.body => require(:post) which is the form_for :post
  private 
  def post_params
    params.require(:post).permit(:author, :photo_url, :date_taken, :tag_ids => [], tags_attributes: [:id, :tag], comments_attributes: [:id, :comment, :username])
  end
end
