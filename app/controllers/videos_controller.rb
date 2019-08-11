class VideosController < ApplicationController
  def index
    @videos = Video.all
  end
  def create
    @video = Video.new(video_params)
    @video.save
    redirect_to @video
  end
  def new
    @video = Video.new
  end
  def edit
    @video = Video.find(params[:id])
  end
  def show
    @video = Video.find(params[:id])
  end
  def update
    @video = Video.find(params[:id])
    @video.update(video_params)
    redirect_to @video
  end
  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_path
  end

  private
  def video_params
    params.require(:video).permit(:title, :author_name, :video_url, :caption)
  end


end
