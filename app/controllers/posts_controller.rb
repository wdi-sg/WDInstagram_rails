require "net/http"
require "json"

# load the gem
require "GiphyClient"

api_instance = GiphyClient::DefaultApi.new

api_key = "dc6zaTOxFJmzC" # String | Giphy API Key.

q = "wwe" # String | Search query term or prhase.

opts = {
  limit: 1, # Integer | The maximum number of records to return.
  offset: 0, # Integer | An optional results offset. Defaults to 0.
  rating: "g", # String | Filters results by specified rating.
  lang: "en", # String | Specify default country for regional content; use a 2-letter ISO 639-1 country code. See list of supported languages <a href = \"../language-support\">here</a>.
  fmt: "json", # String | Used to indicate the expected response format. Default is Json.
}

begin
  #Search Endpoint
  result = api_instance.gifs_search_get(api_key, q, opts)
  #   puts result.data[0].images.fixed_width_downsampled.url
  random_gif = result.data[0].images.fixed_width_downsampled.url
rescue GiphyClient::ApiError => e
  puts "Exception when calling DefaultApi->gifs_search_get: #{e}"
end

puts "HeLLLO"
puts random_gif

class PostsController < ApplicationController
  def index
    puts params
    sort = params[:sort]
    order = params[:order]
    if sort == "date" && order == "desc"
      @posts = Post.all.order("updated_at desc")
    elsif sort == "date" && order == "asc"
      @posts = Post.all.order("updated_at asc")
    else
      @posts = Post.all
    end
    # render plain: "Hello"
  end

  def show
    puts params
    puts @random_gif
    @post = Post.find(params[:id])
  end

  def new
    puts "Hello"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    foo = post_params
    puts foo.inspect
    @post = Post.new(post_params)

    @post.save
    # redirect_to ("/")
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
end

private

def post_params
  params.require(:post).permit(:title, :author_name, :photo_url, :caption)
end
