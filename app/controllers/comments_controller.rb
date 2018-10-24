class CommentsController < ApplicationController


  def new
    # WHAT IS THIS?
    @article = Article.find(params['article_id'])
    # comment = Comment.new(comment_params)
  end

# No need to go back to comment, so you dont use @comment
  def create
    comment = Comment.new(comment_params)
    comment.save

    @article = Article.find(params['article_id'])
    redirect_to @article

  end

  def edit
      # WHY did we use article_id?
      @article = Article.find(params[:article_id])
      @comment = Comment.find(params[:id])
      # WHY CANNOT @COMMENT, AND WHY ARTICLE_ID?
      # @comment = Article.find(params[:id])
    end

    # @comments = Comment.where("article_id=?", params[:id])

  def update
      # @article = Article.find(params[:id])
      @comment = Comment.find(params[:id])
      @article = @comment.article
      @comment.update(comment_params)
      redirect_to @article
  end

  def destroy
      # @article = Article.find(params[:id])
      @comment = Comment.find(params[:id])
      @comment.destroy

      @article = @comment.article

      redirect_to @article
    end


private
  def comment_params
    params.require(:comment).permit(:usercomment, :article_id)
  end

end


