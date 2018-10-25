class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tags = Tag.find(params[:id])
  end

  def new
    @tags = Tag.all
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)

    @tag.save
    redirect_to @tag
  end

  def update
    @tag = Tag.find(params[:id])

    @tag.update(tag_params)
    redirect_to @tag
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:hash_tag)
  end

end