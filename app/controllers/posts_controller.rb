class PostsController < ApplicationController

    def index
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
        # render plain: params[:post].inspect

        @post = Post.new(post_params)

        @post.save
        redirect_to @post
    end

    def update
    end

    def destroy
    end
end