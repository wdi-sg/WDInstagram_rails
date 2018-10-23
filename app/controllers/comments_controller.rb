class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)

        @comment.save
        redirect_to entries_path
      end

    private
      def comment_params
        params.require(:comment).permit(:text, :entry_id)
      end
end
