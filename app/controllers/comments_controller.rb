class CommentsController < ApplicationController
	def create

		@comment = Comment.new(comment_params)

		@comment.save
		@entry = Entry.find(params['entry_id'])
    redirect_to @entry
  end
	
	private
  def comment_params
    params.require(:comment).permit(:message, :author, :entry_id)
  end

end