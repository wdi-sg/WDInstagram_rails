class EntriesController < ApplicationController
  def index
		@entries = Entry.all
		@comments = Comment.all
	end

  def show
		@entry = Entry.find(params[:id])
		@comments = Comment.where(entry_id: params[:id])
		@entry_hashtags = @entry.hashtags
		@hashtags = Hashtag.all
	end

  def new
  end

	def edit
		@entry = Entry.find(params[:id])
  end

	def create
		# render plain: params[:entry].inspect
		@entry = Entry.new(entry_params)

		# split = entry_params.caption.split(' ')

		# split.each do |x|
		# 	if x[0] == '#'
		# 		tag_text = x.slice(1..x.length)
				

		# 	end
		# end


		@entry.save
		redirect_to @entry
  end

  def update
		@entry = Entry.find(params[:id])
	
		@entry.update(entry_params)
		redirect_to @entry
	end

	def destroy
		@entry = Entry.find(params[:id])
		@entry.destroy
	
		redirect_to entries_path
	end
	
	private
  def entry_params
    params.require(:entry).permit(:photo_url, :author, :caption, :date, :hashtag_ids => [])
  end

end