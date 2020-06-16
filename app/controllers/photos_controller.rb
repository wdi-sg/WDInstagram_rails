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
    redirect_to root_path
    end

  private
  def photo_params
    params.require(:photo).permit(:author_name, :photo_url)
  end

end