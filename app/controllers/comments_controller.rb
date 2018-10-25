class CommentsController < ApplicationController

  def index
     # test to see if we are at /parks/:id/rangers or /rangers
  # if params.has_key?(:wdinstagram_id)
  #   # get all the rangers for a specific park
  #   @comments = Comment.where(wdinstagram_id: params[:wdinstagram_id] )
  # else
  #   # get all rangers
  #   @comments = Comment.all
  end

  def show
   # @comment = Comment.find(params[:id])

    #if params[:wdinstagram_id].to_i != @comment.wdinstagram.id
      # do something
    #end
  end

  def new
   # @wdinstagram = Wdinstagram.all
  end

  def edit
    @comment = Comment.find(params[:id])
    @wdinstagram = @comment.wdinstagram
  end

  def create
    @wdinstagram = Wdinstagram.find(comment_params['wdinstagram_id'])
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to @wdinstagram
    #render plain: params[:wdinstagram].inspect
  end

  def update
    @comment = Comment.find(params[:id])
    # @wdinstagram = Wdinstagram.find(params['wdinstagram_id'])
    @comment.update(comment_params)
    @wdinstagram = @comment.wdinstagram
    redirect_to (@wdinstagram)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @wdinstagram = Wdinstagram.find(@comment['wdinstagram_id'])
    @comment.destroy
    redirect_to wdinstagram_path(@wdinstagram)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :wdinstagram_id)
  end

end