class HashtagsController < ApplicationController
	def index
		@hashtags = Hashtag.all
		@entries = Entry.all
	end

  def show
		@hashtag = Hashtag.find(params[:id])
		@entries = @hashtag.entries
	end

	def new
  end

	def edit
		@hashtag = Hashtag.find(params[:id])
  end

	def create
		@hashtag = Hashtag.new(hashtag_params)

		@hashtag.save
		redirect_to @hashtag
  end

  def update
		@hashtag = Hashtag.find(params[:id])
	
		@hashtag.update(hashtag_params)
		redirect_to @hashtag
	end

	def destroy
		@hashtag = Hashtag.find(params[:id])
		@hashtag.destroy
	
		redirect_to hashtags_path
	end
	
	private
  def hashtag_params
    params.require(:hashtag).permit(:content, :entry_ids => [])
  end

end