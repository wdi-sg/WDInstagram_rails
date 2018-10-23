class CommentsController < ApplicationController
  def index
    if params.has_key?(:post_id)
      @comments = Comment.where(post_id: params[:post_id] )
    else
      @comments = Comment.all
    end
  end

  def show
    @comment = Comment.find(params[:id])

    if params[:post_id].to_i != @comment.post_id

    end
  end

  def create
    @comment = Comment.new(comment_params)   
    @comment.save

    redirect_to @comment
  end

  def new
    if params.has_key?(:post_id)
      @posts = Post.where(id: params[:post_id] )
    else
      # get all rangers
      @posts = Post.all
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:username, :comment, :post_id)
  end

end
