class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def create
  @tag = Tag.new(tag_params)
  @tag.save

  render plain: 'ok'
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  end


private
  def tag_params
  params.require(:tag).permit(:hashtag, :post_ids => [])
end
end