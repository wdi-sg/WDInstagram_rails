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
      #do something
    end
  end

  def create
    @comment = Comment.new(comment_params)  
    @comment.user = current_user

    if @comment.save 
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def new
    if params.has_key?(:post_id)
      @posts = Post.where(id: params[:post_id] )
      @username = current_user.email.split('@')[0]
    else
      @posts = Post.all
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy
    redirect_to posts_path
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.user == current_user
      @comment.update(comment_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:username, :comment, :post_id)
  end

end
