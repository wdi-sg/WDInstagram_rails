# require 'byebug'
class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => [ :show, :index ]

  def index

     # test to see if we are at /parks/:id/rangers or /rangers
    if params.has_key?(:article_id)

      # get all the rangers for a specific park
      @comments = Comment.where(article_id: params[:article_id])
      @article = Article.find(params[:article_id])

    else
      # get all rangers
      @comments = Comment.all
    end
 end

  def new
    @article = Article.find(params[:article_id])


    # if @article.user_id != current_user
    #   render 'new'
    # end
  end

  def create
    @article = Article.find(params[:article_id])

    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to article_comment_path(@article, @comment)

  end

  def show
    # deal with the case that we are trying to get a ranger for a park that doesn't exist

    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end


  def edit
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end


  def update

    @comment = Comment.find(params[:id])
    @comment.update(comment_params)

    @article = Article.find(params[:article_id])

    redirect_to article_comments_path(@article)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to article_comments_path(@article)
  end

private

  def comment_params
    params.require(:comment).permit(:content, :article_id, :id)
  end
end
