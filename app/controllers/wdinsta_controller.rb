class WdinstaController < ApplicationController
  
  def index
    if request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "asc"
          @post = Post.all
        else
          @post = Post.all.order(created_at: :desc)
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    @post = Post.new(post_params)

    @post.save
    redirect_to @post
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

    redirect_to root_path
  end

  def sort
    @posts = Post.all.order(created_at: :desc)
  end

  private

  def post_params
    params.require(:postsss).permit(:author_name, :photo_url, :title, :caption)
  end

end