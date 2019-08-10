require 'GiphyClient'

class PostsController < ApplicationController
layout "headbar"
  def index
    if params[:sort_type] == "date_asc"
        @posts=Post.all.order("created_at ASC")
    elsif params[:sort_type] == "date_desc"
        @posts=Post.all.order("created_at DESC")
    else
        @posts=Post.all
    end
    @converted_time = []
    @posts.each do |x|
        @converted_time.push(timeConverted(x.created_at))

    end


  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if(params[:gifCheck] == "true")
        gifImageUrl = getGif()
        @post.photo_url = gifImageUrl.data.image_url
    end

    if @post.save
        redirect_to @post
    else
        render 'new'
    end

  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
        redirect_to @post
    else
        render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
end

private
  def post_params
    params.require(:post).permit(:author_name, :photo_url,:title,:caption)
  end

private
    def timeConverted(time)
        currentTime = Time.now

        timeAgo = currentTime - time.in_time_zone('Singapore')

        seconds = timeAgo.floor
        minute = (seconds / 60).floor
        seconds = seconds % 60
        hour = (minute / 60).floor
        minute = minute % 60
        day = (hour / 24).floor
        hour = hour % 24

        if day > 0
            puts "#{time.strftime("%d")} #{time.strftime("%b")}"
            return "#{time.strftime("%d")} #{time.strftime("%b")}"
        else
            if hour > 0
                return "#{hour} hours ago"
            else
                return "#{minute} mins ago"
            end
        end
    end

private
    def getGif
        api_instance = GiphyClient::DefaultApi.new

        api_key = "SE6bH15pfx2qjEgSYIs6GPhgxNT6Il8S" # String | Giphy API Key.

        opts = {
          fmt: "json" # String | Used to indicate the expected response format. Default is Json.
        }

        begin
          #Random Endpoint
          result = api_instance.gifs_random_get(api_key, opts)

        rescue GiphyClient::ApiError => e
          puts "Exception when calling DefaultApi->gifs_random_get: #{e}"
        end
    end

