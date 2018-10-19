class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save
    redirect_to @photo
  end

  def update
  end

  def destroy
  end

  private

  def photo_params
    params.require(:photo).permit(:author, :photo_url, :date_taken)
  end
end
