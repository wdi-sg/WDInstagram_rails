class CommentsController < ApplicationController

	before_action :authenticate_user!, :except => [ :show, :index ]

	def create

		@comment = Comment.new(comment_params)

		@comment.user = current_user

		@comment.save
		@entry = Entry.find(params['entry_id'])
    redirect_to @entry
  end
	
	private
  def comment_params
    params.require(:comment).permit(:message, :author, :entry_id)
  end

end