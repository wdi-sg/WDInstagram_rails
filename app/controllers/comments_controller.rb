class CommentsController < ApplicationController

  # def index
  #   # test to see if we are at /parks/:id/rangers or /rangers
  #   if params.has_key?(:article_id)
  #     # get all the comments for a specific post
  #     @comments = Comment.where(article_id: params[:article_id] )
  #   else
  #     # get all comments
  #     @comments = Comment.all
  #   end
  # end

  def index
    # UNDERSTAND THE FUCKING SYNTAX
    @comments = Comment.where("article_id=?", params[:id])
  end


  def new
    # WHAT IS THIS?
    @article = Article.find(params['article_id'])
    # comment = Comment.new(comment_params)
  end


  # def show
  #   # deal with the case that we are trying to get a comment for an article that doesn't exist

  #   @comment = Comment.find(params[:id])

  #   if params[:id].to_i == @comment.article.id
  #     @comments = Comment.where("article_id=?", params[:id])
  #   end
  # end


  def create
    comment = Comment.new(comment_params)
    comment.save

    @article = Article.find(params['article_id'])
    redirect_to @article

  end

private
  def comment_params
    params.require(:comment).permit(:usercomment, :article_id)
  end

end


