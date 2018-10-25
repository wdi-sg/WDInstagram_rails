class PhotosController < ApplicationController
  before_action :authenticate_user!
  def index
    @photos = Photo.all
    @all_hashtags = Hashtag.all
  end

  def show
    @photo = Photo.find(params[:id])
    # @comment = @photo.comment
    # @hashtag = @photo.hashtags
    @all_hashtags = Hashtag.all
  end

  def new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    # @photo.user = current_user

    #  if 
      @photo.save
      redirect_to @photo
    #  else 
      # render 'new'
    #  end    
  end

  def update
    @photo = Photo.find(params[:id])

    @photo.update(photo_params)
    
    @photo.hashtags << Hashtag.find(params[:id])
    redirect_to @photo
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_path
  end

  private
  def photo_params
    params.require(:photo).permit(:author, :photo_url, :caption, :hashtag_ids => [])
  end
end