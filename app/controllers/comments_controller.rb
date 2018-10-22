class CommentsController < ApplicationController
  def create
    @photo = Photo.find(comment_params['photo_id'])
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to @photo
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @photo = Photo.find(@comment['photo_id'])
    @comment.destroy
    redirect_to photo_path(@photo)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :photo_id)
  end
end
