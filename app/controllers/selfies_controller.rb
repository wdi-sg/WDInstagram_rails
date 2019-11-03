class SelfiesController < ApplicationController
  def index
      @selfies = Selfy.all
  end

  def show
    @selfy = Selfy.find(params[:id])
  end

  def new
  end

  def edit
    @selfy = Selfy.find(params[:id])
  end

  def create
    # render plain: params[:selfies].inspect
    @selfy = Selfy.new(selfy_params)

    @selfy.save
    redirect_to @selfy
  end

  def update
    @selfy = Selfy.find(params[:id])

    @selfy.update(selfy_params)
    redirect_to @selfy
  end

  def destroy
    @selfy = Selfy.find(params[:id])
    @selfy.destroy

    redirect_to root_path
  end

  private
  def selfy_params
    params.require(:selfies).permit(:title, :author_name, :url, :caption)
  end
end