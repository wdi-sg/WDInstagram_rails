class EntriesController < ApplicationController
  def index
    @entries = Entry.all
    
  end

  def show
    @entry = Entry.find(params[:id])
    #@comments = Entry.find(params[:id])

    #@array = Entry.first.comments.name 
    #@array = Entry.comments;
    
    if params.has_key?(:id)
      #@array = Comment.where(entry_id: params[:id] )
      #byebug
     # @array = Entry.find_by(params[:id])
      @array = @entry.comments
    else
        # get all commemts
      @array = "Sorry no comments yet!"
    end
    
  end

  def new
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.save
    
    #render plain: params[:article].inspect
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
      params.require(:entry).permit(:author, :photo_url)
    end
end