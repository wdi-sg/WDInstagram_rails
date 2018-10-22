class CommentsController < ApplicationController
​
  def new
    @entries = Entry.all
  end
​
  def create
    @comment = Comment.new(comment_params)
​
    @comment.save
    redirect_to @comment
  end
​
  def show
    # deal with the case that we are trying to get a comment for a entry that doesn't exist
​
    @comment = comment.find(params[:id])
​
    if params[:entry_id].to_i != @comment.entry.id
      # do something
    end
  end
​
private
​
  def comment_params
    params.require(:comment).permit(:comment, :entry_id)
  end
end