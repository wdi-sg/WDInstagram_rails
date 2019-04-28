class CommentsController < ApplicationController
  def index

  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
  end

  def edit

  end

  def create
    @comment = Comment.new(comment_params)

    @comment.save
    redirect_to @comment
  end

  def update

  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:author_name, :content, :post_id)
  end

end