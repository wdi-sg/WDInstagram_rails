class InstagramsController < ApplicationController
  def index
  @instagram = Instagram.all
  end

  def show
  @instagram = Instagram.find(params[:id])
  end

  def new
  end

  def edit
  @instagram = Instagram.find(params[:id])
  end

  # def create
  # render plain: params[:instagram].inspect
  # end

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
    params.require(:instagram).permit(:author, :photo_url, :date_taken)
  end

