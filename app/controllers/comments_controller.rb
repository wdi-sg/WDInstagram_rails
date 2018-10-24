class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @photo = @comment.photo
    @comment.save
    redirect_to @photo
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    @photo = @comment.photo
    redirect_to @photo
  end

  def destroy
    @comment = Comment.find(params[:id])
    @photo = @comment.photo
    @comment.destroy
    redirect_to @photo
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :photo_id)
  end
end
