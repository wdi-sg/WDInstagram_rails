class PostsController < ApplicationController
    helper_method :sort_column, :sort_direction
    
    def index
        @posts = Post.order(sort_column + " " + sort_direction)
    end

    def show
        @post = Post.find(params[:id])
    end

    def new

    end

    def create
        @post = Post.new(post_params)
        @post.save
        redirect_to @post
    end

    def edit
        @post = Post.find(params[:id])
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
            params.require(:post).permit(:title, :photo_url, :author_name, :caption)
        end

        def sort_column
            Post.column_names.include?(params[:sort]) ? params[:sort] : "title"
        end

        def sort_direction
            %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
        end 
    
end
