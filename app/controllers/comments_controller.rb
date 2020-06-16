class CommentsController < ApplicationController #ranger
  def index
    # test to see if we are at /comments/:id/comments or /comments
    if params.has_key?(:entry_id)
      # get all the comments for a specific entry
      @comments = Comment.where(entry_id: params[:entry_id] )
    else
      # get all comments
      @comments = Comment.all
    end
  end

  def new
    @entries = Entry.all
  end

  def create
    @comment = Comment.new(comment_params)
    
    @comment.save
    redirect_to @comment
  end

  def show
    # deal with the case that we are trying to get a ranger for a park that doesn't exist
    @comment = Comment.find(params[:id])

    if params[:entry_id].to_i != @comment.entry.id
      # do something
    end
  end

private

  def comment_params
    params.require(:comment).permit(:name, :entry_id)
  end
end