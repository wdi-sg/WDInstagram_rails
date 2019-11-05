class CommentsController < ApplicationController
    def index
        # test to see if we are at /posts/:id/comments or /comments
        if params.has_key?(:post_id)
          # get all the comments for a specific post
          @comments = Comment.where(post_id: params[:post_id] )
        else
          # get all comments
          @comments = Comment.all
        end
    end

    def new
      @posts = Post.all
    end
  
    def create
      @comment = Comment.new(comment_params)
  
      @comment.save
      redirect_to @comment
    end
  
    def show
  
      @comment = Comment.find(params[:id])
  
      if params[:post_id].to_i != @comment.post.id
        # do something
      end
    end
  
  private
  
    def comment_params
      params.require(:comment).permit(:title, :post_id)
    end
  end