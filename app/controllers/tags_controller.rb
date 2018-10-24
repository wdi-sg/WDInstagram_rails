class TagsController < ApplicationController
  def index
  end

  def new
    @posts = Post.all
  end

  def show
  end

  private 

  def tag_params
    params.require(:tag).permit(:tag, :post_ids => [])
  end

end
