require 'GiphyClient'

class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
    @videos = Video.all
    @articles=Article.all
    puts request.query_parameters
    order = request.query_parameters['order']
    type = request.query_parameters['type']
    case type
    when "date"
      @profiles = @profiles.order(:created_at)
      if order == "asc"
        @profiles = @profiles.reverse
      end
    end

  end


  def show
    @profile = Profile.find(params[:id])
  end

  def new
  end

  def create
    @input = profile_params
    if params[:insertGif] == "true"
        api_instance = GiphyClient::DefaultApi.new

        api_key = "e3D4ND23ll9oYVvMUxmGsVdiKT1mEr0q"


        opts = {
          tag: "pokemon",
          rating: "g",
          fmt: "json"
        }

        begin
          result = api_instance.gifs_random_get(api_key, opts)
          puts result.data
        rescue GiphyClient::ApiError => e
          puts "Exception when calling DefaultApi->gifs_search_get: #{e}"
        end
        @input[:photo_url] = result.data.image_url
      end
      @profile = Profile.new(@input)
    @profile.save
    redirect_to @profile
  end

  def edit
     @profile = Profile.find(params[:id])
  end

  def update
      @profile = Profile.find(params[:id])

      @profile.update(profile_params)
      redirect_to @profile
  end

  def destroy
      @profile = Profile.find(params[:id])
      @profile.destroy

      redirect_to root_path
  end


#  def sort
 #   render("Hello world");
 # end
end


private
  def profile_params
    params.require(:profile).permit(:author_name, :photo_url, :title, :caption)
  end