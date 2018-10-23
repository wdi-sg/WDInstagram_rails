class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @entry = Entry.find(@comment['entry_id'])
        @comment.save
        redirect_to entries_path
    end

    def edit
      @comment = Comment.find(params[:id])
    end

    def update
      @comment = Comment.find(params[:id])
      @comment.update(comment_params)
      @entry = Entry.find(@comment['entry_id'])
      redirect_to @entry
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy

      redirect_to entries_path
    end


    private
      def comment_params
        params.require(:comment).permit(:text, :entry_id)
      end
end
