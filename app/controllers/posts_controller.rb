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
        @post = Post.new(post_params)

        @post.save
        redirect_to @post
    end

    def update
        # Get post by ID
        @post = Post.find(params[:id])

        # Update the post to DB
        @post.update(post_params)

        # Redirect user to view the updated post
        redirect_to @post
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to root_path
    end
end

private
    def post_params
        params.require(:post).permit(:title, :photo_url, :author_name)
    end