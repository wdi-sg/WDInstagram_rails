# load the gem
require 'GiphyClient'

api_instance = GiphyClient::DefaultApi.new

api_key = "dc6zaTOxFJmzC" # String | Giphy API Key.

opts = {
  tag: "burrito", # String | Filters results by specified tag.
  rating: "g", # String | Filters results by specified rating.
  fmt: "json" # String | Used to indicate the expected response format. Default is Json.
}

$result = ''

begin
  #Random Endpoint
  $result = api_instance.gifs_random_get(api_key, opts)
  p $result
rescue GiphyClient::ApiError => e
  puts "Exception when calling DefaultApi->gifs_random_get: #{e}"
end



class PostsController < ApplicationController
  def index
    @post = Post.all
    @comment = Comment.all
  end

  def show
    @post= Post.find(params[:id])
    @comment = Comment.where(post_id: params[:id])


  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    #render plain: params[:post].inspect
    if params[:post][:photo_url]
    uploaded_file = params[:post][:photo_url].path
    cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
    #render json: cloudnary_file

    params[:post][:photo_url] = cloudnary_file['public_id']
  else
    params[:post][:photo_url] = $result.data.image_url

  end

    @post = Post.new(post_params)

     @post.save
    redirect_to @post

  end

  def update
    @post = Post.find(params[:id])
    if params[:post][:photo_url]
    uploaded_file = params[:post][:photo_url].path
    cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
    #render json: cloudnary_file

    params[:post][:photo_url] = cloudnary_file['public_id']
  else
    params[:post][:photo_url] = $result.data.image_url

  end

    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:author, :photo_url, :created_by, :caption)
  end
end