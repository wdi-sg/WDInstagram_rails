require_relative 'boot'

require 'rails/all'

# load the gem
require 'GiphyClient'

api_instance = GiphyClient::DefaultApi.new

api_key = "7yGWoRXy0edZPb0CdtZd0ZdriO15R0yI" # String | Giphy API Key.

opts = {
  tag: "burrito", # String | Filters results by specified tag.
  rating: "g", # String | Filters results by specified rating.
  fmt: "json" # String | Used to indicate the expected response format. Default is Json.
}

begin
  #Random Endpoint
  result = api_instance.gifs_random_get(api_key, opts)
  p result
rescue GiphyClient::ApiError => e
  puts "Exception when calling DefaultApi->gifs_random_get: #{e}"
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WDInstagramRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end