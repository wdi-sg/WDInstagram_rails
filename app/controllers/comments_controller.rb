class CommentsController < ApplicationController
   def create
     @comment = Comment.new(comment_params)
     @comment.save
     redirect_to instagrams_path
   end

   private

   def comment_params
     params.require(:comment).permit(:text, :instagram_id)
   end
 end