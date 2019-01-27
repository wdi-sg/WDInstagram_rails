class InstaController < ApplicationController
  def index

  end

  def show
    @post = Insta.find(params[:id])
  end

  def new

  end

  def edit

  end

  def create
    @post = Insta.new(insta_params)
    @post.save
    redirect_to @post
  end

  def update

  end

  def destroy

  end

  private
    def insta_params
      params.require(:post).permit(:title, :caption)
    end

end
