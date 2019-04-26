class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    render plain: params[:post].inspect
  end

  def update
  end

  def destroy
  end
end