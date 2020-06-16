class PostsController < ApplicationController

    def index

        if params[:order] == 'asc'
            @posts = Post.all.order('DATE(created_at) asc')
        elsif params[:order] == 'desc'
            @posts = Post.all.order('DATE(created_at) desc')
        end
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
        # render plain: params.inspect
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
        params.require(:post).permit(:title, :photo_url, :caption, :author_name)
    end