class VideosController < ApplicationController
  def index
    @videos = Video.all().order("created_at DESC")
     request.query_parameters[:sort]
    if request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "asc"
      @videos = Video.all().order("created_at ASC")
    elsif request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "desc"
      @videos = Video.all().order("created_at DESC")
    end
  end

  def show
    @video = Video.find(params[:id])
  end


  def edit
    @video = Video.find(params[:id])
  end

  def create
    @video = Video.new(video_params)

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