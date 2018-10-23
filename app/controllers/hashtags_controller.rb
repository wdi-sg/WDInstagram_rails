class HashtagsController < ApplicationController
  
  def show
    @photo = Photo.find(params[:photo_id])
    @hashtags = @photo.hashtags
  end 

  def new
    @photo = Photo.find(params[:photo_id])
    @all_hashtags = Hashtag.all
  end

  def create
    @hashtag = Hashtag.new(hashtag_params)

    @hashtag.save
    # @photo = Photo.find(params[:hashtag][:photo_id])
    redirect_to @photo
  end

  def update
    if params[:photo][:hashtag_id]
      @photo.hashtags << Hashtag.find(params[:photo][:hashtag_id])
    end
    redirect_to @photo
  end
  private
  def hashtag_params
    params.require(:hashtag).permit(:hashtag, :photo_id => [])
  end
end