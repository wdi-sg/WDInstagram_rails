require 'GiphyClient'
require 'byebug'

class PostsController < ApplicationController
    helper_method :sort_column, :sort_direction

    def index
        @posts = Post.order(sort_column + " " + sort_direction)
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        api_instance = GiphyClient::DefaultApi.new

        api_key = ENV['GIPHYCLIENT_API_KEY']# String | Giphy API Key.

        q = "cheeseburgers" # String | Search query term or prhase.

        opts = {
        limit: 25, # Integer | The maximum number of records to return.
        offset: 0, # Integer | An optional results offset. Defaults to 0.
        rating: "g", # String | Filters results by specified rating.
        lang: "en", # String | Specify default country for regional content; use a 2-letter ISO 639-1 country code. See list of supported languages <a href = \"../language-support\">here</a>.
        fmt: "json" # String | Used to indicate the expected response format. Default is Json.
        }
        begin
            #Search Endpoint
            result = api_instance.gifs_search_get(api_key, q, opts)
            p result
            rescue GiphyClient::ApiError => e
            puts "Exception when calling DefaultApi->gifs_search_get: #{e}"
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
            params.require(:post).permit(:title, :photo_url, :author_name, :caption)
        end

        def sort_column
            Post.column_names.include?(params[:sort]) ? params[:sort] : "title"
        end

        def sort_direction
            %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
        end

end
