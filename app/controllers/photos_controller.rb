class PhotosController < ApplicationController
  def index
    @photos = Photo.all


    # render plain: "test"

  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.where(photo_id: params[:id])

    # render plain: params[:id].inspect
  end

  def new
  end

  def edit
    @photo = Photo.find(params[:id])

    # render plain: "edit"
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save

    redirect_to @photo
    # render plain: params[:photo].inspect
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to @photo
    # redirect_to "http://www.google.com"
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