# The methods for each RESTful action
# Assume that PostsController refers to posts? in routes.rb
class PostsController < ApplicationController
  def index
    @posts = Post.all
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
    # Dealing with PostgreSQL here..
    # Everytime we get here we assign @post to..(?)
    @post = Post.new(post_params)
    # Insert data to DB..
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

  # Why private?
  private
  def post_params
    # 'require' what is in the form..
    params.require(:post).permit(:author_name, :photo_url, :title)
  end
end