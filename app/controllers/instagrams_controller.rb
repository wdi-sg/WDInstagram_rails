class InstagramsController < ApplicationController

  def index
    # @instagrams = Instagram.all
    # @commentsCount = Comment.group(:instagram_id).count

     if params.has_key?(:tag_id)
       @instagrams = Tag.find(params[:tag_id]).instagrams
     else
       @instagrams = Instagram.all
     end

  end

  def show
    @instagram = Instagram.find(params[:id])
    @comments = Comment.where(instagram_id: params[:id])
    @tags = @instagram.tags

  end

  def new
    @tags = Tag.all
  end

  def edit
    @instagram = Instagram.find(params[:id])
  end

  def create
    @instagram = Instagram.new(instagram_params)

  @instagram.save
  redirect_to @instagram
  end

  def update
    @instagram = Instagram.find(params[:id])

    @instagram.update(instagram_params)
    redirect_to @instagram
  end

  def destroy
    @instagram = Instagram.find(params[:id])
    @instagram.destroy

    redirect_to instagrams_path
  end
end


private
  def instagram_params
    params.require(:instagram).permit(:username, :image_url, :date_taken, :caption, :tag_ids => [])
  end

