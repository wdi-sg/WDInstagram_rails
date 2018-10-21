class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
    @post= Post.find(params[:id])
  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    #render plain: params[:post].inspect
    uploaded_file = params[:post][:photo_url].path
    cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
    #render json: cloudnary_file

    params[:post][:photo_url] = cloudnary_file['public_id']

    @post = Post.new(post_params)

     @post.save
    redirect_to @post
  end

  def update
    @post = Post.find(params[:id])
    uploaded_file = params[:post][:photo_url].path
    cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
    #render json: cloudnary_file

    params[:post][:photo_url] = cloudnary_file['public_id']

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
    params.require(:post).permit(:author, :photo_url, :date)
  end
end