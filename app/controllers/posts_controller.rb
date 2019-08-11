class PostsController < ApplicationController
  def index

    # @posts = Post.all
    # @posts = Post.order(updated_at: :asc)


    @posts = [];

    Post.all.each do |post|
      @posts.push(post)
    end

    if request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "asc"
      @posts = @posts.sort_by { |result| result[:updated_at] }
    elsif request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "desc"
      @posts = @posts.sort_by { |result| result[:updated_at] }.reverse
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