class EntriesController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  def index
    @entries = Entry.all
    @comment = Comment.all
  end

  def show
    @entry = Entry.find(params[:id])
    @tags = @entry.tags
    @comment = Comment.where(entry_id: params[:id])
    @user = User.where(entry_id: params[:id])
  end

  def new
    @tags = Tag.all
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    if @entry.save
      redirect_to @entry
    else
      render 'new'
    end
  end

  def update
    @entry = Entry.find(params[:id])
    if current_user != @entry.user
      redirect_to root_path #redirecting to root path if not the user. can redirect to another page as well
    else
      @entry.update(entry_params)
      redirect_to @entry
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    redirect_to entries_path
  end

  private

  def entry_params
    params.require(:entry).permit(:photo_url, :author, :caption, :date_taken, tag_ids: [])
  end
end
