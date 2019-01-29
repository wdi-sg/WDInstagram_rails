# load the gem
require 'GiphyClient'

api_instance = GiphyClient::DefaultApi.new

api_key = "dc6zaTOxFJmzC" # String | Giphy API Key.

opts = { 
  tag: "burrito", # String | Filters results by specified tag.
  rating: "g", # String | Filters results by specified rating.
  fmt: "json" # String | Used to indicate the expected response format. Default is Json.
}

begin
  #Random Sticker Endpoint
  result = api_instance.stickers_random_get(api_key, opts)
  p result
rescue GiphyClient::ApiError => e
  puts "Exception when calling DefaultApi->stickers_random_get: #{e}"
end

class HomeController < ApplicationController
  def index
  end
end
