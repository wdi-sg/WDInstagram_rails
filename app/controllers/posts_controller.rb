class PostsController < ApplicationController
    def index
        order = if params.has_key?("sort")
                    params[:sort][:order].to_sym
                else
                    :asc
                end
        @choice = if params.has_key?("sort")
                    params[:sort][:order]
                  else
                    "asc"
                  end 
        @posts = Post.order(updated_at: order)
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
            params.require(:post).permit(:title, :photo_url, :author_name, :caption, :updated_at)
        end

  end
  