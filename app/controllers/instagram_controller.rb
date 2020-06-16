class InstagramController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    url = "http://api.giphy.com/v1/gifs/random?&api_key=7yGWoRXy0edZPb0CdtZd0ZdriO15R0yI&limit=1"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
    @img = result['data']['image_url']
    @instagram = Post.all
    if params[:post] == '1'
      @instagram = Post.all.order("author_name asc")
    elsif params[:post] == '2'
      @instagram = Post.all.order("id asc")
    elsif params[:post] == '3'
      @instagram = Post.all.order("created_at desc")
    elsif params[:post] == '4'
      @instagram = Post.all.order("updated_at desc")
    end
  end

  def show
    @post = Post.find(params[:id])
    @instagram = Post.all
  end

  def new
    require 'net/http'
    require 'json'
    url = "http://api.giphy.com/v1/gifs/random?&api_key=7yGWoRXy0edZPb0CdtZd0ZdriO15R0yI&limit=1"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
    @img = result['data']['image_url']
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(instagram_params)

    @post.save
    redirect_to action: "show", id: @post.id
  end

  def update
    @post = Post.find(params[:id])

    @post.update(instagram_params)
    redirect_to action: "show", id: @post.id
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to action: "index"
  end

  private
  def instagram_params
    params.require(:post).permit(:author_name, :photo_url, :caption)
  end
end