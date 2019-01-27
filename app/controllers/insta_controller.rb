class InstaController < ApplicationController
  def index
    @posts = Insta.all
  end

  def show
    @post = Insta.find(params[:id])
  end

  def new

  end

  def edit
    @post = Insta.find(params[:id])
  end

  def create
    @post = Insta.new(insta_params)
    @post.save
    redirect_to root_path
  end

  def update
    @post = Insta.find(params[:id])
    @post.update(insta_params)
    redirect_to @post
  end

  def destroy
    @post = Insta.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private
    def insta_params
      params.require(:insta).permit(:title, :caption)
    end

end
