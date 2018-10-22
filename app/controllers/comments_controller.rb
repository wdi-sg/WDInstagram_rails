class CommentsController < ApplicationController
  def index
    @comments = Comment.where("entry_id=?", params[:id])
  end

  def new
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

  def edit
   @entry = Entry.find(params['entry_id'])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    @entry = Entry.find(params['entry_id'])
    redirect_to @entry
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @entry = Entry.find(params['entry_id'])
    redirect_to @entry
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:entry_id)
  end
end