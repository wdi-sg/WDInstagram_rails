class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.all

  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    puts request.referrer

    redirect_to request.referrer

  end

  private def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
