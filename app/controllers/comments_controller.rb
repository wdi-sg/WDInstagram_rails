class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @comments = Comment.where("entry_id=?", params[:id])
  end

  def new
    @entry = Entry.find(params["entry_id"])
  end

  def create
    # Comment.create(params[:content],params[:id])
    @comment = Comment.new(comment_params)
    @comment.entry = Entry.find(params[:entry_id])

    if @comment.save
      redirect_to @comment.entry
    else
      redirect_to root_path
    end

    # @entry = Entry.find(params['entry_id'])
    # redirect_to @comment.entry
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    @entry = Entry.find(params["entry_id"])
    redirect_to @entry
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @entry = Entry.find(params["entry_id"])
    redirect_to @entry
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :entry_id)
  end
end
