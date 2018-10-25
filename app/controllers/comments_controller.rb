class CommentsController < ApplicationController

  before_action :authenticate_user!, :except => [ :show, :index ]

  def new
    # WHAT IS THIS?
    # when you put an @ before something, its accessible in your form
    @article = Article.find(params['article_id'])
    @comment = Comment.new
  end

# No need to go back to comment, so you dont use @comment
  def create
    @comment = Comment.new(comment_params)
    @article = Article.find(params['article_id'])
    @comment.article = @article
    @comment.user = current_user

    if @comment.save
      redirect_to @comment.article
    else
      redirect_to root_path
    end
    # puts @comment.errors.full_messages
  end

  def edit
      # WHY did we use article_id?
      @article = Article.find(params[:article_id])
      @comment = Comment.find(params[:id])
      # WHY ARTICLE_ID?
      # @comment = Article.find(params[:id])
      if @comment.user != current_user
        redirect_to @article
      end
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
      # @article = @comment.article

      if @comment.user == current_user
        @comment.destroy
      end
      @article = Article.find(params["article_id"])
      redirect_to @article
    end


private
  def comment_params
    params.require(:comment).permit(:usercomment, :article_id)
  end

end


