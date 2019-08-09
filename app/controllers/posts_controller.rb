require 'GiphyClient'

class PostsController < ApplicationController
  def index
    @posts = Post.all().order("created_at DESC")
    p request.query_parameters[:sort]
    if request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "asc"
      @posts = Post.all().order("created_at ASC")
    elsif request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "desc"
      @posts = Post.all().order("created_at DESC")
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new


  end

  def create
    @input = post_params
    if @input.delete("random") == "1"
      api_instance = GiphyClient::DefaultApi.new

      api_key = "dc6zaTOxFJmzC"

      opts = {
        tag: "pokemon",
        rating: "g",
        fmt: "json"
      }

      begin
        result = api_instance.gifs_random_get(api_key, opts)
      rescue GiphyClient::ApiError => e
        puts "Exception when calling DefaultApi->gifs_search_get: #{e}"
      end
      @input[:photo_url] = result.data.image_url
    end
    @post = Post.new(@input)
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
    params.require(:post).permit(:author, :photo_url, :random, :title, :caption)
  end

end