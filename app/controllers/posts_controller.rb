class PostsController < ApplicationController
    def index
        # render plain: "hello"
        @posts = Post.all
    end
  
    def show
        @post = Post.find(params[:id])
    end
  
    def new
    end
  
    def edit
    end
  
    def create
        @post = Post.new(post_params)
        @post.save
        redirect_to @post
        # render plain: params[:post].inspect
    end
  
    def update
    end
  
    def destroy
    end

    private
        def post_params
            params.require(:post).permit(:author_name, :photo_url, :title)
        end

  end
  