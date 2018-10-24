class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def create
  @tag = Tag.new(tag_params)
  @tag.save

  redirect_to tag_path(@tag)
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to tag_path(@tag)
  end


private
  def tag_params
  params.require(:tag).permit(:hashtag, :post_ids => [])
end
end