class HashtagsController < ApplicationController
  def new

  end

  def create
    @hashtag = Hashtag.new(hashtag_params)
    @hashtag.save

    redirect_to root_path
  end


  private
  def hashtag_params
    params.require(:hashtag).permit(:name, :entry_ids => [])
  end
end
