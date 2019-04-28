class PostsController < ApplicationController

  def index
    @test = "HAHAHAHAH"
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @posts = Post.find(params[:id])
  end

  def new
  end

  def create
      # render plain: params[:post].inspect
      @posts = Post.new(post_params)

      @posts.save
      redirect_to @posts

  end

  def edit
    @posts = Post.find(params[:id])
  end


  def update
    @posts = Post.find(params[:id])

    @posts.update(post_params)
    redirect_to @posts
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy

    redirect_to root_path
  end

private
  def post_params
    params.require(:post).permit(:author_name, :title, :photo_url, :caption)
  end

end