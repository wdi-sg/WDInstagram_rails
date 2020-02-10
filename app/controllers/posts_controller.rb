require 'GiphyClient'

class PostsController < ApplicationController
  def index
    @posts = Post.all().order("created_at DESC")

    if request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "asc"
      @posts = Post.all().order("created_at ASC")
    elsif request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "desc"
      @posts = Post.all().order("created_at DESC")
    end

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
  def Giphy

    api_instance = GiphyClient::DefaultApi.new

    api_key = "dc6zaTOxFJmzC" # String | Giphy API Key.

     # String | Search query term or prhase.

    opts = {
     fmt: "json" # String | Used to indicate the expected response format. Default is Json.
    }

    begin
      #Search Endpoint
      result = api_instance.gifs_search_get(api_key, opts)

    rescue GiphyClient::ApiError => e
      puts "Exception when calling DefaultApi->gifs_search_get: #{e}"
    end

end

  private
  def post_params
    params.require(:post).permit(:author_name, :photo_url, :title, :caption)
  end
end