

class EntriesController < ApplicationController
  def index
    @entries = Entry.order(id: :desc)
  end

  def show
    @entry = Entry.find(params[:id])
    @comments = Comment.where("entry_id=?", params[:id])
    @tags = @entry.tags
    @alltags = Tag.all
  end

  def new
    api_instance = GiphyClient::DefaultApi.new
    api_key = ENV['GIPHY']
    # String | Giphy API Key.

    opts = { 
      tag: "burrito", # String | Filters results by specified tag.
      rating: "g", # String | Filters results by specified rating.
      fmt: "json" # String | Used to indicate the expected response format. Default is Json.
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
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.save
    redirect_to @entry
  end

  def update
    @entry = Entry.find(params[:id])

    if params[:entry][:tag_id]
      @entry.tags << Tag.find(params[:entry][:tag_id])
    else
      @entry.update(entry_params)
    end
    redirect_to @entry
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    
    redirect_to entries_path
  end

  private
  def entry_params
    params.require(:entry).permit(:photo_url, :author, :caption, :tag_ids => [])
  end
end