class VideosController < ApplicationController
  def index
    @videos = Video.all().order("created_at DESC")
    p request.query_parameters[:sort]
    if request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "asc"
      @videos = Video.all().order("created_at ASC")
    elsif request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "desc"
      @videos = Video.all().order("created_at DESC")
    end
  end

  def show

    @video = Video.find(params[:id])
    @youtube_id
    if @video.video_url[/youtu\.be\/([^\?]*)/]
      @youtube_id = $1
    else
      @video.video_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      @youtube_id = $5
    end


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
    @post = Video.find(params[:id])
    @video.update(post_params)
    redirect_to @video
  end

  def destroy
    @post = Video.find(params[:id])
    @post.destroy
    redirect_to videos_path
  end

  private
  def video_params
    params.require(:video).permit(:author, :video_url, :title, :caption)
  end

end