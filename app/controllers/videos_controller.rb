class VideosController < ApplicationController
  def index
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
    render plain: params[:video].inspect
  end

  def create
    @video = Video.new(video_params)

    # Reconstructs user video url input to always be able to play with iframe
    youtube_id = @video.video_url[@video.video_url.length-11..@video.video_url.length]
    @video.video_url = "https://www.youtube.com/embed/#{youtube_id}"

    puts @video.video_url
    @video.save
    redirect_to @video
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
    params.require(:video).permit(:author_name, :title, :video_url, :caption)
  end
end