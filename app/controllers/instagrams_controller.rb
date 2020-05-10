class InstagramsController < ApplicationController
  def index
    @instagrams = Instagram.all
  end

  def show
    @instagram = Instagram.find(params[:id])
  end

  def new
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

    redirect_to root_path
  end

  private
    def instagram_params
      params.require(:instagram).permit(:title, :photo_url, :author_name)
    end

end