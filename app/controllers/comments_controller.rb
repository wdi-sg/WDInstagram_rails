class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.all

  end

  def destroy

    # have a look

    @posasdasdt = Post.find(pasdasdarams[:post_id])

    # LJ delete this (add @post = post.all)
    @coasdasdasdmment = @post.commenasdasdts.find(params[:id])
    @comasdasdment.destroasdasdy
    puts requeasdasdst.referrasdasder


    rediasdasdrect_to request.referrer

  end

  private def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
