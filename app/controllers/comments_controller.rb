class CommentsController < ApplicationController

    def new
        @photo = Photo.find(params[:photo_id])
        @comments = @photo.comment
    end

    def create
        @photos = Photo.find(params[:photo_id])
        @comment = Comment.new(comment_params)
        @comment.save
        redirect_to @photos

        # render plain: params[:comment].inspect
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def destroy
        @photos = Photo.find(params[:photo_id])
        @comment = Comment.find(params[:id])
        @comment.destroy

        redirect_to @photos
    end

    private

    def comment_params
        params.require(:comment).permit(:comment, :photo_id)
    end
end
