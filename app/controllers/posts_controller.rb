class PostsController < ApplicationController

  def index
    # get the list of posts
    @posts = Post.all()

  end

  def new
  end

  def create
    @post = Post.new(post_params)

    @post.save()

    redirect_to @post
    # render plain: params[:article].inspect
  end

  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])

    @post.update(post_params)

    redirect_to @post
    # render plain: params[:post].inspect
  end


  def show
    @showpost = Post.find(params[:id])
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end


  private
  def post_params
    params.require(:post).permit(:title, :author_name, :photo_url, :mediatype, :caption)
  end

end