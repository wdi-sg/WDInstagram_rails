class EntriesController < ApplicationController

	before_action :authenticate_user!, :except => [ :show, :index ]

  def index
		@entries = Entry.all
		@comments = Comment.all
	end

  def show
		@entry = Entry.find(params[:id])
		@comments = @entry.comments
		@entry_hashtags = @entry.hashtags
		@hashtags = Hashtag.all
	end

  def new
  end

	def edit
		@entry = Entry.find(params[:id])
  end

	def create
		@entry = Entry.new(entry_params)

		@entry.user = current_user

		split = @entry.caption.split(' ')

		split.each do |x|
			if x[0] == '#'
				tag_text = x.slice(1..x.length)

				all_tags = Hashtag.all
				exists = false;
				
				all_tags.each do |x|
					if x.content == tag_text
						@entry.hashtags << x
						exists = true;
					end
				end

				if !exists 
					new_tag = Hashtag.new(content: tag_text)
					new_tag.save
					@entry.hashtags << new_tag
				end		
			end
		end

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