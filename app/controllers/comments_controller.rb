class CommentsController < ApplicationController
  def new
      @entry = Entry.find(params[:entry_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    @entry = Entry.find(params[:entry_id])
    redirect_to @entry
  end

  def show
    # deal with the case that we are trying to get a comment for a entry that doesn't exist
​
    @entry = Entry.find(params[:entry_id])

​
    # if params[:entry_id].to_i != @comment.entry.id
    #   # do something
    # end
  end

  private
  def comment_params
    params.require(:comment).permit(:commentContent, :entry_id)
  end

end