class GifsController < ApplicationController

  def search
    if params[:search]
      @searchterm = params[:search]
      @resp = Gif.search(@searchterm)
      @gifs = @resp['data']
      redirect_to new_gif_path
    else
      @resp = Gif.search_fixed
      @gifs = @resp['data']
    end
  end

  def new

    if params[:search]
      @searchterm = params[:search]
      @resp = Gif.search(@searchterm)
      @gifs = @resp['data']
    else
      @resp = Gif.search_fixed
      @gifs = @resp['data']
    end
  end

  def create
    @gif = Gif.new(gif_params)

    @gif.save
    redirect_to @gif
  end

  def edit
    @gif = Gif.find(params[:id])
  end

  def update
    @gif = Gif.find(params[:id])

    @gif.update(gif_params)
    redirect_to @post
  end


  def destroy
    @gif = Gif.find(params[:id])

    @gif.destroy()
    redirect_to gifs_path
  end

  private
  def gif_params
    params.require(:gif).permit(:title, :author_name, :gif_url, :caption)
  end
end