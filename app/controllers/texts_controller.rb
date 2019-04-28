require 'byebug'

class TextsController < ApplicationController
  def show
    @text = Text.find(params[:id])
  end

  def new
  end

  def create
    @text = Text.new(text_params)

    @text.save
    redirect_to @text
  end

  def edit
    @text = Text.find(params[:id])
  end

  def update
    @text = Text.find(params[:id])

    @text.update(text_params)
    redirect_to @text
  end

  def destroy
    @text = Text.find(params[:id])

    @text.destroy
    redirect_to root_path
  end

private
  def text_params
    params.require(:text).permit(:author_name, :description, :title, :caption)
  end

end