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

  private 

  def tag_params
    params.require(:tag).permit(:tag, :post_ids => [])
  end

end
