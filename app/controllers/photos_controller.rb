class PhotosController < ApplicationController
  def index
    if params.has_key?(:tag_id)
      @photos = Tag.find(params[:tag_id]).photos
    else
      @photos = Photo.all
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @comments = Comment.where(photo_id: params[:id])
    @tags = @photo.tags
  end

  def new
    @tags = Tag.all
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save
    redirect_to @photo
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to @photo
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:author, :photo_url, :date_taken, :caption, :tag_ids => [])
  end
end
