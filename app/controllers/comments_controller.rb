class CommentsController < ApplicationController
  def index
    # @comments = Comment.all
  end

  def show
    # @comment = Comment.find(params[:id])
  end

  def new

  end

  def edit
    # @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save

    @post = Post.find(params[:post_id]) # Question: why is this :post_id and not :id??
    redirect_to @post
  end

  def update
    # @comment = Comment.find(params[:id])
    # @comment.update(comment_params)

    # redirect_to
  end

  def destroy
    # @comment = Comment.find(params[:id])
    # @comment.destroy

    # redirect_to posts_path
  end


  private

  def comment_params
    params.require(:comment).permit(:author, :content, :post_id)
  end

end







