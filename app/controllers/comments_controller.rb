class CommentsController < ApplicationController
   def create
     @comment = Comment.new(comment_params)
     @instagram = @comment.instagram
     @comment.save
     redirect_to @instagram
   end


   def edit
     @comment = Comment.find(params[:id])
   end

    def update
     @comment = Comment.find(params[:id])
     @comment.update(comment_params)
     @instagram = @comment.instagram
     redirect_to @instagram
   end

   def destroy
     @comment = Comment.find(params[:id])
     # @instagram = Instagram.find(@comment['instagram_id'])
     @instagram = @comment.instagram
     @comment.destroy
     redirect_to @instagram
   end

   private

   def comment_params
     params.require(:comment).permit(:text, :instagram_id)
   end
 end