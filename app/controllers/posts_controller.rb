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
  before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    @post = Post.all
    @comment = Comment.all
  end

  def show
    @post= Post.find(params[:id])
    @comment = Comment.where(post_id: params[:id])
    @tags = @post.tags
    @alltags = Tag.all

    # @new_comment = Comment.new
  end

  def new
    @tags = Tag.all

  end

  def edit
    @tags = Tag.all
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
    @post.user = current_user
    @post.save

    #splitCaption = params[:post][:caption].split(" ")
    splitCaption = @post.caption.split(" ")
    splitCaption.each do |x|
      if x[0] == '#' # if its a hashtag

        # remove #
        text = x.slice(1..x.length)

        # check if it exists
        alltags = Tag.all
        exists = false

        alltags.each do |y|
          if text == y.hashtag
            @post.tags << y
            exists = true
          end
        end

        if !exists
          new_tag = Tag.new(hashtag: text)
          new_tag.save
          @post.tags << new_tag
        end
      end
    end


    redirect_to @post
  end


  def update
    @post = Post.find(params[:id])


  #if params[:post][:tag_id]
   # @post.tags << Tag.find(params[:post][:tag_id])

  if params[:post][:photo_url]
    uploaded_file = params[:post][:photo_url].path
    cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
    #render json: cloudnary_file
    params[:post][:photo_url] = cloudnary_file['public_id']

  elsif params[:post][:photo_url] == ""
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
    params.require(:post).permit(:author, :photo_url, :created_by, :caption, :tag_ids => [])
  end
end