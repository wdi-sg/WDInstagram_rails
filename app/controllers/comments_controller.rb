class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    redirect_to root_path
  end


  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    @comment.save
    @post = Post.find(params[:comment][:post_id])

    redirect_to (@post)
  end

   def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    # @post = Post.find(params[:post_id])
    @post = @comment.post

    redirect_to (@post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @post = @comment.post

    redirect_to (@post)
  end

private

  def comment_params
    params.require(:comment).permit(:name, :post_id, :text)
  end
end