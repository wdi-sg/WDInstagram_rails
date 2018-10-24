class TagsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def show
    @tag = Tag.find(params[:id])
    @entries = @tag.entries
  end

  def index
    @tags = Tag.all
  end
end
