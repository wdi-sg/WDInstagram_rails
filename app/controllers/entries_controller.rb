class EntriesController < ApplicationController
  before_action :authenticate_user!, :except => [ :show, :index ]
  def index
      @entries = Entry.all

  end

  def show
    @entry = Entry.find(params[:id])
    # Create a comment instance on where the comment was made
    @comments = Comment.where(entry_id: params[:id])
    #@new_comment = Comment.new (When you add this you can change the contents here
    #<%= form_with scope: :comment, url: comments_path, local: true do |form| %> in show.html.erb to
    # to <%= form_with model: @new_comment local: true do |form| %> but the route will be determined
    # by rails)

    @hashtags = @entry.hashtags

    #@hashtags = Hashtag.all

  end

  def new
    @hashtags = Hashtag.all
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.save
    #redirect_to @entry
    @entry.user = current_user
    if @entry.save
      redirect_to @entry
    else
      render 'new'
    end
    # this renders the entry params into the browser window w/o saving it into db
    #render plain: params[:entry].inspect
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
    params.require(:entry).permit(:author, :photo_url, :date_taken, :hashtag_ids => [])
  end
end
