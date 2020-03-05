class TextsController < ApplicationController

  def index
  	@texts = Text.all
  end

  def show
  	@text = Text.find(params[:id])
  end

  def new
 
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
  	 @text= Text.find(params[:id])

  	 @text.update(text_params)
  	 redirect_to @text
  end

  def destroy
  	@text= Text.find(params[:id])
  	@text.destroy

  	redirect_to home_path
  end

  private
  def text_params
    params.require(:text).permit(:title, :author_name, :body)
  end
end
