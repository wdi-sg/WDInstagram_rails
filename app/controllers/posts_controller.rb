class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
    @tags = @post.tags

  end

  def new
    # load the gem
    require 'GiphyClient'

    api_instance = GiphyClient::DefaultApi.new

    api_key = "dc6zaTOxFJmzC" # String | Giphy API Key.

    opts = {
      tag: "burrito", # String | Filters results by specified tag.
      rating: "g", # String | Filters results by specified rating.
      fmt: "json" # String | Used to indicate the expected response format. Default is Json.
    }

    begin
      #Random Endpoint
      result = api_instance.gifs_random_get(api_key, opts)
      @image_url = result.data.image_original_url
    rescue GiphyClient::ApiError => e
      puts "Exception when calling DefaultApi->gifs_random_get: #{e}"
    end

  end

  def create

    if params[:post][:photo_url] == ''
      params[:post][:photo_url] = params[:post][:alt_url]
      params[:post].delete :alt_url
      @post = Post.new(post_params)
    else
      @post = Post.new(post_params)
    end

    @post.user = current_user
    if @post.save
      @post.save
      redirect_to @post
    else
      render 'new'
    end

    # render plain: params[:post].inspect

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
    redirect_to 'index'
  end

  private

  def post_params
    params.require(:post).permit(:author, :photo_url, :caption, :date_taken)
  end
end