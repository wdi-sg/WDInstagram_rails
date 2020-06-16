class CommentsController < ApplicationController

  def index

    @comment = Comment.all

  end

   def show

    @comment = Comment.find(params[:id])

  end

  def new

      @instagram = Instagram.find(params[:photo_id])

  end

  def create

    @comment = Comment.new(comment_params)

    @comment.save

    @instagram = Instagram.find(params[:id])

    redirect_to @instagram

  end

  def edit

    @comment = Comment.find(params[:id])

  end

   def update

    @comment = Comment.find(params[:id])

     @comment.update(comment_params)

    redirect_to @comment

  end

  def destroy

    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to @instagram

  end

  private

  def comment_params

  params.require(:comment).permit(:text, :photo_id)

  end

end 
​
