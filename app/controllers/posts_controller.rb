class PostsController < ApplicationController
  def index
    # @posts = Post.all
    @posts = Post.order(updated_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def sortIndex
    # render plain: params.inspect
    @sort_column = params[:sort_column]
    @sort_order = params[:sort_order]
    case @sort_column
    when "Updated"
      @sort_column = "updated_at"
    when "Created"
      @sort_column = "created_at"
    when "Captions"
      @sort_column = "captions"
    when "Title"
      @sort_column = "title"
    when "Author Name"
      @sort_column = "author_name"
    end
    # @posts = Post.order(updated_at: :desc)

    @posts = Post.order(@sort_column+" "+@sort_order)

  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    # render plain: params[:post].inspect
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

end

private
  def post_params
    params.require(:post).permit(:author_name, :photo_url, :title, :captions)
  end