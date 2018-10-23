class WdinstagramsController < ApplicationController

  def index
    @wdinstagrams = Wdinstagram.all
  end

  def show
    @wdinstagram = Wdinstagram.find(params[:id])
    @comments = Comment.where(wdinstagram_id: params[:id])
  end

  def new
  end

  def edit
    @wdinstagram = Wdinstagram.find(params[:id])
  end

  def create
    #render plain: params[:wdinstagram].inspect
    @wdinstagram = Wdinstagram.new(wdinstagram_params)
    @wdinstagram.save
    redirect_to @wdinstagram
  end

  def update
    @wdinstagram = Wdinstagram.find(params[:id])
    @wdinstagram.update(wdinstagram_params)
    redirect_to @wdinstagram
  end

  def destroy
    @wdinstagram = Wdinstagram.find(params[:id])
    @wdinstagram.destroy
    redirect_to wdinstagrams_path
  end

  private
  def wdinstagram_params
    params.require(:wdinstagram).permit(:author, :photo_url, :date_taken)
  end

end