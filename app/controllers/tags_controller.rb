class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @posts = Post.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save

    redirect_to @tag
  end

  def destroy
    @tag = Tag.find(params[:id])

    @tag.destroy
    #redirect back to page where we left off
    redirect_to request.referer
  end

  private 

  def tag_params
    params.require(:tag).permit(:tag, :post_ids => [])
  end

end


