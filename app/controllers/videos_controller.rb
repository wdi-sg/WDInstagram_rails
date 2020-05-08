class VideosController < ApplicationController
  def index
  end

  def show
puts "here";
    @video = Video.find(params[:id])
    puts @video;
  end

  def new
  end

  def edit
    @video = Video.find(params[:id])
  end

  def create
      @video = Video.new(video_params)

  @video.save
  redirect_to @video
    #render plain: "hello"
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
end

private
  def video_params
    params.require(:video).permit(:title, :url)
  end