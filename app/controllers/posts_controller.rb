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

    def sort
      @posts = Post.all
      order = params[:order]
      if order == "desc"
        @posts = @posts.sort_by {|post| post.created_at}.reverse
      else
        @posts = @posts.sort_by {|post| post.created_at}
      end

      render :index
    end

    private
    def post_params
      params.require(:post).permit(:author_name, :photo_url, :title, :caption)
    end

  end


