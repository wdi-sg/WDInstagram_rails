require "GiphyClient"

class PhotosController < ApplicationController
  def index
    puts params
    order = params[:order]
    if order == "desc"
      @photos = Photo.all.order("updated_at desc")
    elsif order == "asc"
      @photos = Photo.all.order("updated_at asc")
    else
      @photos = Photo.all
    end
  end

  def show
    @photo = Photo.find(params[:id])
    puts @photo.inspect
  end

  def new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    make_gif = params[:accept]

    if make_gif
      require "GiphyClient"
      api_key = "4YVy8t1tpXxCo5s9UrZ2LmGBosuFe55t"
      require "GiphyClient"

      api_instance = GiphyClient::DefaultApi.new

      api_key = "4YVy8t1tpXxCo5s9UrZ2LmGBosuFe55t" # String | Giphy API Key.

      q = photo_params[:photo_url] # String | Search query term or prhase.

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
        random_gif = result.data[0].images.downsized_large.url
        @photo = Photo.new(photo_params)
        @photo[:photo_url] = random_gif
        @photo.save
      rescue GiphyClient::ApiError => e
        puts "Exception when calling DefaultApi->gifs_search_get: #{e}"
      end
    else
      @photo = Photo.new(photo_params)
      @photo.save
    end

    redirect_to root_path
  end

  def update
    @photo = Photo.find(params[:id])

    @photo.update(photo_params)
    redirect_to root_path
  end

  def delete
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to root_path
  end
end

private

def photo_params
  params.require(:photo).permit(:author_name, :photo_url, :title, :caption)
end
