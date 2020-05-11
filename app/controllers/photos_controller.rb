class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def new
	end

	def create
	  @photo = Photo.new(photo_params) #create photo with params
	  @photo.save #entered into database

	  redirect_to @photo #redirect to show page
	end

  def update
    @photo = Photo.find(params[:id]) #find the photo with id = :id

    @photo.update(article_params) #update with new params
    redirect_to @photo #redirect to show page
  end

  def destroy
    @photo = Photo.find(params[:id]) #find the photo with id = :id
    @photo.destroy #delete photo

    redirect_to root_path #redirect to homepage
  end


	private #set private methods
	def photo_params #delimit params
		params.require(:photo).permit(:title, :photo_url, :author_name)
	end
	
end