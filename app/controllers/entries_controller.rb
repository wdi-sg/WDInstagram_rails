class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    #render plain: params[:entry].inspect
    @entry = Entry.new(entry_params)
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
    redirect_to root_path
  end

private
  def entry_params
    params.require(:entry).permit(:author, :photo_url, :caption, :date_taken)
  end

end