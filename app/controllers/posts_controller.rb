class PostsController < ApplicationController



  def index
    sort_by = params[:sort]

    puts @result

    if sort_by == "date"
      @posts = Post.all.order("created_at DESC")
    elsif sort_by == "title"
      @posts = Post.all.order("title ASC")
    else
      @posts = Post.all()
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    
    @post = Post.new(post_params)
    @post.save
    redirect_to @post

  end

  def new
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :photo_url, :author_name, :caption )
  end


end
