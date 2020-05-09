class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def desc
    @posts = Post.order(:created_at).reverse_order
    render "index"
  end

  def asc
    @posts = Post.order(:created_at)
    render "index"
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
    # render plain: params[:post].inspect
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
    params.require(:post).permit(:title, :author_name, :post_content, :caption, :sort)
  end
end
