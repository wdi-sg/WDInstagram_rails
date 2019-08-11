class PostsController < ApplicationController
    def index
        @posts = Post.all
        puts "######################################"
        puts @conds
        puts @order

    end

    def show
        @post = Post.find(params[:id])
    end

    def sort
        @posts = Post.all
        @conds = params[:conds]
        @order = params[:order]
        puts @conds
        puts @order
        if @order == "asc"
            @posts = @posts.sort_by {|a| a[@conds]}
        else
            @posts = @posts.sort_by {|a| a[@conds]}.reverse
        end
        render :index
    end

    def new
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
            params.require(:post).permit(:author_name, :photo_url, :title, :caption)
        end


end
