class PhotosController < ApplicationController
  def index
    @photos = Photo.all


    # render plain: "test"

  end

  def show
    @photo = Photo.find(params[:id])

    # render plain: params[:id].inspect
  end

  def new
  end

  def edit

    render plain: "edit"
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save

    redirect_to @photo
    # render plain: params[:photo].inspect
  end

  def update
  end

  def destroy
  @photo = Photo.find(params[:id])
  @photo.destroy

  redirect_to @photo
  end

private

  def photo_params
    params.require(:photo).permit(:name, :photo_url)
  end
end