class EntriesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @entries = Entry.order(id: :desc)
  end

  def show
    @entry = Entry.find(params[:id])
    @comments = @entry.comments
    #@tags = @entry.tags
    @alltags = Tag.all
  end

  def new
    api_instance = GiphyClient::DefaultApi.new
    api_key = ENV["GIPHY"]
    # String | Giphy API Key.

    opts = {
      tag: "burrito", # String | Filters results by specified tag.
      rating: "g", # String | Filters results by specified rating.
      fmt: "json", # String | Used to indicate the expected response format. Default is Json.
    }

    begin
      #Random Endpoint
      result = api_instance.gifs_random_get(api_key, opts)
    rescue GiphyClient::ApiError => e
      puts "Exception when calling DefaultApi->gifs_random_get: #{e}"
    end

    @gif = result.data.image_original_url
  end

  def edit
    @entry = Entry.find(params[:id])
    if @entry.user != current_user
      redirect_to entries_path
    end
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    @entry.save
    redirect_to @entry
  end

  def update
    @entry = Entry.find(params[:id])

    # if params[:entry][:tag_id]
    #   @entry.tags << Tag.find(params[:entry][:tag_id])
    # else
    @entry.update(entry_params)
    #
    redirect_to @entry
  end

  def destroy
    @entry = Entry.find(params[:id])
    if @entry.user == current_user
      @entry.destroy
    end
    redirect_to entries_path
  end

  private

  def entry_params
    params.require(:entry).permit(:photo_url, :author, :caption, :tag_ids => [])
  end
end
