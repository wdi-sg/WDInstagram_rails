# require 'net/http'
# require 'json'
require 'GiphyClient'


class PostsController < ApplicationController
    def index
      @posts = Post.all + Video.all
      puts "posts isisisisis", @posts[0]
      @posts = @posts.sort_by {|a| a.created_at}.reverse

      
    end
  
    def show
      @post = Post.find(params[:id])
    end
  
    def new
     
      
    end
  
   
    def edit
      @post = Post.find(params[:id])
    end
  
    def create
      @input = post_params
      if params[:insertGif] == "true"
        api_instance = GiphyClient::DefaultApi.new
  
        api_key = "e3D4ND23ll9oYVvMUxmGsVdiKT1mEr0q"
        
        
        opts = {
          tag: "banana",
          rating: "g",
          fmt: "json"
        }
  
        begin
          result = api_instance.gifs_random_get(api_key, opts)
          puts result.data
        rescue GiphyClient::ApiError => e
          puts "Exception when calling DefaultApi->gifs_search_get: #{e}"
        end
        @input[:photo_url] = result.data.image_url
      end
      @post = Post.new(@input)
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

    def sort
      @posts = Post.all + Video.all
 
      order = params[:order]
      if order == "desc"
        @posts = @posts.sort_by {|post| post.created_at}.reverse
       
      else
        @posts = @posts.sort_by {|post| post.created_at}
       
      end

      render :index
    end

    private
    def post_params
      params.require(:post).permit(:author_name, :photo_url, :random, :title, :caption)
    end

  end


