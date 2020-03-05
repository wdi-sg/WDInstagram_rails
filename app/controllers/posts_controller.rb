require 'GiphyClient'


class PostsController < ApplicationController
  def index

    @posts = [];

    Post.all.each do |post|
      @posts.push(post)
    end

    Video.all.each do |video|
      @posts.push(video)
    end

    Text.all.each do |text|
      @posts.push(text)
    end

    if request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "asc"
      @posts = @posts.sort_by { |post| post[:updated_at] }
    elsif request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "desc"
      @posts = @posts.sort_by { |post| post[:updated_at] }.reverse
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

  private
  def post_params
    params.require(:post).permit(:author_name, :title, :photo_url, :caption)
  end


end