class CommentsController< ApplicationController

  def new
    @entries = Entry.all
  end

  def create
    @comment = Comment.new(comment_params)

    @comment.save
    @entries = Entry.find(params[:comment][:entry_id])
    redirect_to (@entries)
  end

 def edit
    @comment = Comment.find(params[:id])
  end

private

  def comment_params
    params.require(:comment).permit(:id, :description, :entry_id)
  end
end