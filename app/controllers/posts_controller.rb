# load gem
require 'GiphyClient'
require 'byebug'

class PostsController < ApplicationController
  def index
    @results = [];

    Video.all.each do |video|
      @results.push(video)
    end

    Post.all.each do |post|
      @results.push(post)
    end

    Text.all.each do |text|
      @results.push(text)
    end

    if request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "desc"
      @results = @results.sort_by { |result| result[:created_at] }.reverse
    else
      @results = @results.sort_by { |result| result[:created_at] }
    end
  end


  def show
    @post = Post.find(params[:id])
  end


  def new
    begin
      api_instance = GiphyClient::DefaultApi.new
      api_key = ENV['GIPHYCLIENT_API_KEY']

      opts = {
        tag: "Attack on Titan",
        rating: "g",
        fmt: "json"
      }

      @result = api_instance.gifs_random_get(api_key, opts)
      # @result = "https://media2.giphy.com/media/uiMTiXW94z280/giphy.gif"

    rescue GiphyClient::ApiError => e
      puts "Exception when calling DefaultApi->gifs_random_get: #{e}"
    end
  end


  def create
    @post = Post.new(post_params)

    @post.save
    redirect_to @post
  end


  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])

    @post.update(post_params)
    redirect_to @post
  end


  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to root_path
  end


private
  def post_params
    params.require(:post).permit(:author_name, :photo_url, :title, :caption)
  end

end