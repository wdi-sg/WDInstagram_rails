class CommentsController < ApplicationController
  def create
    @photo = Photo.find(comment_params['photo_id'])
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to @photo
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :photo_id)
  end
end
