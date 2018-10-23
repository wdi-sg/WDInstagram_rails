class CommentsController < ApplicationController

  def new
    @comments = Article.all
  end

  def create
    @comment = Comment.new(comment_params)

    @comment.save
    redirect_to @comment
  end

  def show
    # deal with the case that we are trying to get a comment for an article that doesn't exist

    @comment = Comment.find(params[:id])

    if params[:article_id].to_i != @comment.article.id
      # do something [TBC]
    end
  end

private

  def comment_params
    params.require(:comment).permit(:usercomment, :article_id)
  end
end