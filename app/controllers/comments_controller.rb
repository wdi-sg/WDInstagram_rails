class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)

    @comment.save
    @post = Post.find(params[:comment][:post_id])

    redirect_to (@post)
  end

   def edit
    @comment = Comment.find(params[:id])
  end

private

  def comment_params
    params.require(:comment).permit(:id, :name, :post_id, :text)
  end
end