class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to photos_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :photo_id)
  end
end
