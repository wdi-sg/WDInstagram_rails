class WdinstagramsController < ApplicationController
  before_action :authenticate_user!, :except => [ :show, :index ]
  def index
      if params.has_key?(:wdinstagram_id)
    # get all the rangers for a specific park
        @tags = Tag.where(wdinstagram_id: params[:wdinstagram_id] )
      else
        @wdinstagrams = Wdinstagram.all
      end
  end

  def show
    @wdinstagram = Wdinstagram.find(params[:id])
    @comments = Comment.where(wdinstagram_id: params[:id])
    @tags = @wdinstagram.tags
    @tags = Tag.all
   # @commentTotal = Comment.group(wdinstagram_id: params[:id])
  end

  def edit
    @wdinstagram = Wdinstagram.find(params[:id])
  end

  def new
    @tags = Tag.all
  end

  def create

    #render plain: params[:wdinstagram].inspect
    @wdinstagram = Wdinstagram.new(wdinstagram_params)
    @wdinstagram.user = current_user

      if @wdinstagram.save
        redirect_to @wdinstagram
      else
        render 'new'
      end
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
    params.require(:wdinstagram).permit(:author, :photo_url, :date_taken, :tag_ids=>[])
  end

end