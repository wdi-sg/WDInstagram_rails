class PostsController < ApplicationController

  def index
    @posts = Post.all
  end
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end
  def new
    @post = Post.new
  end
  def edit
    @post = Post.find(params[:id])
  end
  def show
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
    redirect_to posts_path
  end
  def randomgif
    # load the gem
    require 'GiphyClient'
    api_instance = GiphyClient::DefaultApi.new
    api_key = "dhpyEtBxO2tWTgOJQ7Orv5YDvlfCjbgH" # String | Giphy API Key.
    opts = {
      limit: 25, # Integer | The maximum number of records to return.
      offset: 0, # Integer | An optional results offset. Defaults to 0.
      rating: "g", # String | Filters results by specified rating.
      lang: "en", # String | Specify default country for regional content; use a 2-letter ISO 639-1 country code. See list of supported languages <a href = \"../language-support\">here</a>.
      fmt: "json" # String | Used to indicate the expected response format. Default is Json.
    }
    begin
      #Search Endpoint
      result = api_instance.gifs_random_get(api_key)
      render json:result
    rescue GiphyClient::ApiError => e
      puts "Exception when calling DefaultApi->gifs_search_get: #{e}"
    end
  end



  private
  def post_params
    params.require(:post).permit(:title, :author_name, :photo_url, :caption)
  end

end
