class PostsController < ApplicationController 
    def index      
        @posts = Post.all
    end

    def show

    end
    
    def new

    end
    
    def edit

    end
    
    def create

    end
    
    def destroy

    end
    
    private
    def post_params
    params.require(:post).permit(:author,:photo_url,:text)
    end
end
