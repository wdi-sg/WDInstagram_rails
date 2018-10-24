class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  # private

  # def tag_params
  #   params.require(:tag).permit()
  # end

end







