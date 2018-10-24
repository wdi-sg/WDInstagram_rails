class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      @comment.save
    end

    redirect_to @post

  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:comment][:post_id])

    @comment.update(comment_params)
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :post_id, :id)
  end

end