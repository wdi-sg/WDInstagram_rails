class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @wdinstagrams = Wdinstagram.all
    @tags = Tag.all
  end

  def create
    #render plain: params[:tag].inspect
    @tag = Tag.new(tag_params)

    @tag.save
    redirect_to @tag

  end

  def show
    @tag = Tag.find(params[:id])
    #@wdinstagrams = @tag.id

  end

  private

  def tag_params
    params.require(:tag).permit(:tag)
  end

end