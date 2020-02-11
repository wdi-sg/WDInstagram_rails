class PicturesController < ApplicationController
    def index
      # credit to ben flex lee
      puts params["order"]
      if params["order"] == "dec"
        @pictures = Picture.all.order('created_at DESC')
      else 
      @pictures = Picture.all
      end
    end
  
    def show
      @picture = Picture.find(params[:id])
    end
  
    def new
    end
  
    def edit
      @picture = Picture.find(params[:id])
    end
  
    def create
      @picture = Picture.new(picture_params)

      @picture.save
      redirect_to @picture
      # render plain: @picture.inspect
    end
  
    def update
      @picture = Picture.find(params[:id])

      @picture.update(picture_params)
      redirect_to @picture
    end
  
    def destroy
      @picture = Picture.find(params[:id])
      @picture.destroy
    
      redirect_to root_path
    end

    private
    def picture_params
      params.require(:picture).permit(:author_name, :photo_url, :title, :captions, :gif_query)
    end
    
  end