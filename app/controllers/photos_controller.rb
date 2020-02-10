class PhotosController < ApplicationController
  def index
  end

  def show
    @photo = Photo.find(params[:id])
    puts @photo.inspect
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
end

private

def photo_params
  params.require(:photo).permit(:author_name, :photo_url, :title)
end
