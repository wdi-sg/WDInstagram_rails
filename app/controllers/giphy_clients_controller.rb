class GiphyClientsController < ApplicationController
	# load the gem
require 'GiphyClient'

api_instance = GiphyClient::DefaultApi.new

api_key = "dc6zaTOxFJmzC" # String | Giphy API Key.

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
