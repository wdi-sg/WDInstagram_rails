# load gem
require 'byebug'
require 'google/apis'
require 'google/apis/youtube_v3'
require 'trollop'

class VideosController < ApplicationController

  def index
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
    q = ['Attack on Titan', 'Death Note', 'Godzilla', 'Sonic', 'DMC 5', 'One Piece', 'Final Fantasy 7', 'Final Fantasy 8', 'Final Fantasy 9', 'Final Fantasy 10', 'Power Ranger', 'Dark Knight Joker', 'Superman', 'Avengers Infinity War', 'One Punch Man', 'Chrono Cross', 'Mario'].shuffle

    service = Google::Apis::YoutubeV3::YouTubeService.new

    service.authorization = nil
    service.key = ENV['YOUTUBECLIENT_API_KEY']

    response = service.list_searches('snippet', max_results: '1', q: q.sample).to_json

    item = JSON.parse(response).fetch("items")[0]
    @video_id = item.fetch("id")["videoId"]
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
    params.require(:video).permit(:author_name, :video_url, :title, :caption)
  end

end