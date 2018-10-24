class HashtagsController < ApplicationController

  def index
    @hashtags = Hashtag.all

  end

  def new

    @posts = Post.all
  end

  def create
    @hashtag = Hashtag.new(hashtag_params)
    @hashtag.save
    redirect_to root_path
  end

  def destroy
    @hashtag = Hashtag.find(params[:id])
    @hashtag.destroy

    redirect_to hashtags_path
  end

  private
  def hashtag_params
    params.require(:hashtag).permit(:title, :post_ids => [])
  end

end
