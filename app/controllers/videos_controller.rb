class VideosController < ApplicationController
  
  def index
  	@videos= Video.all
  end



  def show
  	  @video = Video.find(params[:id])

  end

  def new
  end

  def edit
  end

  def create
  	@video = Video.new(video_params)
  	@video.allow_iframe

  	@video.save
  	redirect_to @video
  	
  end

  def update
  end

  def destroy
  	@video= Video.find(params[:id])
  	@videi.destroy

  	redirect_to home_path
  end

  private
  def video_params
    params.require(:video).permit(:title, :author_name, :video_url, :caption)
  end

  
end
