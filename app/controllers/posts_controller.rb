class PostsController < ApplicationController

    #good practice order:  index, show, new, edit, create, update and destroy
    def index
        @posts = Post.all
    end

    def show # mus always have a view html for each def
        @post = Post.find(params[:id])
    end 

    def new
        @post = Post.new
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
       
        if @post.update(post_params)
          redirect_to @post
        else
          render 'edit'
        end
    end


    def destroy
    @post = Post.find(params[:id])
    @post.destroy
   
    redirect_to posts_path
    end


    private
        def post_params
            params.require(:post).permit(:name,:url)
        end
end
