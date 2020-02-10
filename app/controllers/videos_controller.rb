class VideosController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  @video = Video.new(video_params)

  @video.save
  redirect_to root_url
end

  def update
  end

  def destroy
  end
end

private

def video_params
  params.require(:video).permit(:video_url)
end
