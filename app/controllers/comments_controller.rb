class CommentsController < ApplicationController

  def index
    @comment = Comment.all
  end

   def show
    @comment = Comment.find(params[:id])
  end

   def new
    @comment = Comment.all
  end

   def edit
    @comment = Comment.find(params[:id])
  end

   def create
    @comment = Comment.new(comment_params)
     @comment.save

    redirect_to @comment
  end

   def update
    @comment = Comment.find(params[:id])
     @comment.update(entry_params)
    redirect_to @comment
  end

   def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
     redirect_to comments_path
  end

   private
  def comment_params
    params.require(:comment).permit(:user_comment, :entry_id)
  end
 end 
​
