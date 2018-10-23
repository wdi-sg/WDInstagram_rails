class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @hashtags = Hashtag.all
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    uploaded_file = params[:entry][:photo_url].path
    cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)

    params[:entry][:photo_url] = cloudnary_file['public_id']


    @entry = Entry.new(entry_params)

    @entry.save
    redirect_to @entry
  end

  def update
    @entry = Entry.find(params[:id])
    uploaded_file = params[:entry][:photo_url].path
    cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)

    params[:entry][:photo_url] = cloudnary_file['public_id']

    @entry.update(entry_params)
    redirect_to @entry
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    redirect_to( entries_path )
  end

private
  def entry_params
    params.require(:entry).permit(:author, :photo_url, :caption, :date_taken, :hashtag_ids => [])
  end

end