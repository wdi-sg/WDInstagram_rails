class HashtagsController < ApplicationController

  def index
    if params.has_key?(:article_id)
      # get all the rangers for a specific park
      @hashtags = Hashtag.where(article_id: params[:article_id] )
    else
      # get all rangers
      @hashtags = Hashtag.all

    end

 end

  def new

  end

  def create

    @hashtags = Hashtag.find(params[:id])
    # @hashtag.save
    redirect_to articles_path
  end

  def show
    # deal with the case that we are trying to get a ranger for a park that doesn't exist

    @hashtag = Hashtag.find(params[:id])


  end

  def update


  end

private

  def hashtag_params
    params.require(:hashtag).permit(:text)
  end
end
