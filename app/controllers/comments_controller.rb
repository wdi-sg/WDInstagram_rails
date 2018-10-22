class CommentsController < ApplicationController
  def index
    @comments = Comment.where("entry_id=?", params[:id])
  end

  def new
    puts params
    @entry = Entry.find(params['entry_id'])
  end

  def create
    Comment.transaction do
    comment = Comment.new(comment_params)
    comment.save!
    end
    @entry = Entry.find(params['entry_id'])
    redirect_to @entry
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:entry_id)
  end
end