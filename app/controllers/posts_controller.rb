class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        # This will render the view page with 'new' as the file name.
    end

    def edit
        @post = Post.find(params[:id])
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

private
    def post_params
        params.require(:post).permit(:title, :photo_url, :author_name)
    end