class PagesController < ApplicationController

  def index
    @pages = Page.all
    end

  def show
    @page = Page.find(params[:id])
    end

  def new
    end

  def edit
    @page = Page.find(params[:id])
    end

  def create

   @page = Page.new(page_params)
   @page.save
   redirect_to root_path

    end

  def update

    @page = Page.find(params[:id])
    @page.update(page_params)
    redirect_to root_path
    end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to root_path
    end

private
    def page_params
      params.require(:page).permit(:author_name, :photo_url, :title, :caption)
    end

end