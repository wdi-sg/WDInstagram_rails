require_relative 'boot'

require 'rails/all'

require 'net/http'
require 'json'
url="http://api.giphy.com/v1/gifs/search?q=ryan+gosling&api_key=3TM9W92RMV3BlV2c8ssMAh5swl9qqS1E&limit=5"
resp = Net::HTTP.get_response(URI.parse(url))
buffer = resp.body
result = JSON.parse(buffer)
puts result

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Instagram
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
