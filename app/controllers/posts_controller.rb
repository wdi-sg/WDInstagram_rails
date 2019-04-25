# load the gem
require 'GiphyClient'
require 'byebug'

class PostsController < ApplicationController
  def index
    if request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "desc"
      @posts = Post.order(created_at: :desc)
    else
      @posts = Post.all
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    api_instance = GiphyClient::DefaultApi.new
    api_key = "IZZ1hxiEr4OSORVd7eQEfpb2SczKlS26" # String | Giphy API Key.

    opts = {
      tag: "Attack on Titan", # String | Filters results by specified tag.
      rating: "g", # String | Filters results by specified rating.
      fmt: "json" # String | Used to indicate the expected response format. Default is Json.
    }

    begin
      #Random Endpoint
      # @result = api_instance.gifs_random_get(api_key, opts)
      @result = "https://media2.giphy.com/media/uiMTiXW94z280/giphy.gif"

    rescue GiphyClient::ApiError => e
      puts "Exception when calling DefaultApi->gifs_random_get: #{e}"
    end

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
    params.require(:post).permit(:author_name, :photo_url, :title, :caption, :gif_url)
  end

end