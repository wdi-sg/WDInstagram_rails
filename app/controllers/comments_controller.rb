class CommentsController < ApplicationController


  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to @post
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    @comment.update(comment_params)
    redirect_to @post
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :post_id, :id)
  end

end