#to get the random gif
#https://github.com/Giphy/giphy-ruby-client/blob/master/docs/DefaultApi.md#gifs_random_get
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
  #Random Endpoint
  $result = api_instance.gifs_random_get(api_key, opts)
  p $result
rescue GiphyClient::ApiError => e
  puts "Exception when calling DefaultApi->gifs_random_get: #{e}"
end

class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
    @hashtags = @entry.hashtags
  end

  def new
    @hashtags = Hashtag.all
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    if params[:entry][:photo_url]
      uploaded_file = params[:entry][:photo_url].path
      cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)

      params[:entry][:photo_url] = cloudnary_file['public_id']
    else
      params[:entry][:photo_url] = $result.data.image_original_url
    end

    @entry = Entry.new(entry_params)

    @entry.save
    redirect_to @entry
  end

  def update
    @entry = Entry.find(params[:id])
    uploaded_file = params[:entry][:photo_url].path
    cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)

    params[:entry][:photo_url] = cloudnary_file['public_id']

    @entry.update(entry_params)
    redirect_to @entry
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    redirect_to( entries_path )
  end

private
  def entry_params
    params.require(:entry).permit(:author, :photo_url, :caption, :date_taken, :hashtag_ids => [])
  end

end