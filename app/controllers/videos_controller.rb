# load gem
require 'byebug'

class VideosController < ApplicationController
  def index
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
  end

  def create
    @video = Video.new(video_params)

    @video.save
    redirect_to @video
  end

  def edit
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
    redirect_to root_path
  end

private
  def video_params
    params.require(:video).permit(:author_name, :video_url, :title, :caption, :created_at)
  end

end