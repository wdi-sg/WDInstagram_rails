class VideosController < ApplicationController

  def index
    @videos = Video.all
    @videos = Video.order(created_at: :desc)
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
  end

  def edit
     @video = Video.find(params[:id])
  end

  def create
    @video = Video.new(post_params)

    @video.save
    redirect_to root_path
  end

  def update
    @video = Video.find(params[:id])

    @video.update(post_params)
    redirect_to @video
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    redirect_to root_path
  end

  private

  def post_params
    params.require(:video).permit(:author_name, :video_url, :title, :caption)
  end

end