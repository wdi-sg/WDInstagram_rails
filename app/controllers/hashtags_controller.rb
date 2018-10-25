class HashtagsController < ApplicationController
  def show
    @photo = Photo.find(params[:photo_id])
  end 

  def new
    @photo = Photo.find(params[:photo_id])

    # @all_hashtags = Hashtag.all
  end

  def create
    @hashtag = Hashtag.new(hashtag_params)
    @hashtag.save
    @photo = Photo.find(params[:photo_id])
    redirect_to @photo
  end

  def update
    @photo = Photo.find(params[:photo_id])

    # if params[:id]
      @photo.hashtags << Hashtag.find(params[:id])
    # end
    @photo.save
    redirect_to @photo
  end
  
  private
  def hashtag_params
    params.require(:hashtag).permit(:hashtag, :photo_ids => [])
  end
end