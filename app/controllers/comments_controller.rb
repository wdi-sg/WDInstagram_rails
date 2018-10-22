class CommentsController < ApplicationController

  def index
     # test to see if we are at /parks/:id/rangers or /rangers
    if params.has_key?(:article_id)
      # get all the rangers for a specific park
      @comments = Comment.where(article_id: params[:article_id] )
    else
      # get all rangers
      @comments = Comment.all
    end
 end

  def new
    @articles = Article.all
  end

  def create
    @comment = Comment.new(comment_params)

    @comment.save
    redirect_to @comment
  end

  def show
    # deal with the case that we are trying to get a ranger for a park that doesn't exist

    @comment = Comment.find(params[:id])

    # if params[:article_id].to_i != @articles.comment.id
    #   # do something
    # end
  end

private

  def comment_params
    params.require(:comment).permit(:content, :article_id)
  end
end
