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
    end
  
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
    
      redirect_to root_path
    end

    private
    def post_params
        params.require(:post).permit(:title,:author_name,:photo_url,:caption, :text)
     end

  end