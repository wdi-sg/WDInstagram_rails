class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @entries = @tag.entries
  end

  def index
    @tags = Tag.all
  end
end
