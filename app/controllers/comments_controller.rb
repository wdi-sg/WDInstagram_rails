class CommentsController < ApplicationController
  
  def show
    @photo = Photo.find(params[:photo_id])
  end      
  
  def new
    @photo = Photo.find(params[:photo_id])
  end

  def create
    @comment = Comment.new(comment_params)

    @comment.save
    @photo = Photo.find(params[:photo_id])
    redirect_to @photo
  end

  def edit
    @comment = Comment.find(params[:id])

  end

  def update
    @comment = Comment.find(params[:id])

    @comment.update(comment_params)

    # @photo = Photo.find(params[:photo_id])
    @photo = @comment.post
    redirect_to @photo
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy
    @photo = Photo.find(params[:photo_id])
    redirect_to @photo
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :photo_id)
  end
end
