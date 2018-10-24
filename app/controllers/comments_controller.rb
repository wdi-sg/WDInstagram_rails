class CommentsController < ApplicationController

  def new
    render plain: "test"

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save

    @photo = Photo.find(params[:comment][:photo_id])
    redirect_to @photo
    #render plain: params[:comment].inspect
  end


private

  def comment_params
    params.require(:comment).permit(:name, :comment, :photo_id)
  end
end