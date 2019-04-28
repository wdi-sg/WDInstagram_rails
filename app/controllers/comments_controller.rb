class CommentsController < ApplicationController

  def index
       # test to see if we are at /parks/:id/rangers or /rangers
    if params.has_key?(:post_id)
      # get all the rangers for a specific park
      @comments = Comment.where(post_id: params[:post_id] )
    else
      # get all rangers
      @comments = Comment.all
    end
  end

  def show
    @comment = Comment.find(params[:id])

    if params[:post_id].to_i != @comment.post.id
      render plain: "LOL"
    end

  end

  def new
    @posts = Post.all
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
    params.require(:comment).permit(:content, :post_id)
  end

end