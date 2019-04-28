class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show

    end

    def new

    end

    def create
          render plain: params[:post].inspect
    end

    def edit

    end

    def update

    end

    def destroy
    
    end
    
end
