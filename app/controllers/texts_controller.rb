class TextsController < ApplicationController
  def index
    @texts = text.all().order("created_at DESC")
     request.query_parameters[:sort]
    if request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "asc"
      @texts = text.all().order("created_at ASC")
    elsif request.query_parameters[:sort] == "date" && request.query_parameters[:order] == "desc"
      @texts = text.all().order("created_at DESC")
    end
  end

  def show
    @text = Text.find(params[:id])
  end


  def edit
    @text = Text.find(params[:id])
  end

  def create
    @text = Text.new(text_params)

    @text.save
    redirect_to @text
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
    params.require(:text).permit(:author_name, :title, :caption)
  end


end