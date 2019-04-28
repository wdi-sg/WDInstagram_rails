class PostsController < ApplicationController
    def index
        #@posts = Post.all
    end

    def show

    end

    def new

    end

    def create
        @post = Post.new(post_params)
        @post.save
        redirect_to @post
    end

    def edit

    end

    def update

    end

    def destroy
    
    end
    
end
