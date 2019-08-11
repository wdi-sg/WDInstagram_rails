# require 'GiphyClient'

# api_instance = GiphyClient::DefaultApi.new

# api_key = "dc6zaTOxFJmzC" # String | Giphy API Key.

# q = "cheeseburgers" # String | Search query term or prhase.

# opts = { 
#   limit: 25, # Integer | The maximum number of records to return.
#   offset: 0, # Integer | An optional results offset. Defaults to 0.
#   rating: "g", # String | Filters results by specified rating.
#   lang: "en", # String | Specify default country for regional content; use a 2-letter ISO 639-1 country code. See list of supported languages <a href = \"../language-support\">here</a>.
#   fmt: "json" # String | Used to indicate the expected response format. Default is Json.
# }

class PostsController < ApplicationController
	
  def main
    @results = []
    @posts = Post.all
    @videos = Video.all
    @texts = Text.all
    @results.push(@posts)
    @results.push(@videos)
    @results.push(@texts)
  end
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
 #  	begin
	#   #Search Endpoint
	#   @result = api_instance.gifs_search_get(api_key, q, opts)
	 
	#   rescue GiphyClient::ApiError => e
	#   puts "Exception when calling DefaultApi->gifs_search_get: #{e}"
	# end
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
  	 @post= Post.find(params[:id])

  	 @post.update(post_params)
  	 redirect_to @post
  end

  def destroy
  	@post= Post.find(params[:id])
  	@post.destroy

  	redirect_to home_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :author_name, :photo_url, :caption)
  end


  # private
  # def text_params
  #   params.require(:text).permit(:title, :author_name, :body)
  # end

  # def video_params
  #   params.require(:video).permit(:title, :author_name, :video_url, :caption)
  # end
end
