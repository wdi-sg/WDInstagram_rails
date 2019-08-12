class InstagramsController < ApplicationController

    def index
        @instagram_all = InstagramPost.all
        @instagram_video_all = InstagramVideo.all
        @instagram_text_all = InstagramText.all
    end

    def show_post

        @instagram_indiv = InstagramPost.find(params[:id])

    end

    def show_video

      @instagram_indiv_video = InstagramVideo.find(params[:id])

    end

    def show_text

      @instagram_indiv_text = InstagramText.find(params[:id])

    end

    def new_posts
    end

    def new_videos
    end

    def new_texts
    end

    def edit

        @instagram_edit = InstagramPost.find(params[:id])

    end

    def edit_video

        @instagram_edit_video = InstagramVideo.find(params[:id])

    end

    def edit_text
        @instagram_edit_text = InstagramText.find(params[:id])
    end

    def create_posts

        @instagram_create = InstagramPost.new(instagram_params)

        @instagram_create.save
        redirect_to @instagram_create
        # render plain: params[:instagram].inspect

    end

    def create_videos

        # render plain: params[:instagram_video].inspect

        @instagram_video_create = InstagramVideo.new(instagram_video_params)
        # puts @instagram_video_create
        @instagram_video_create.save
        redirect_to @instagram_video_create

    end

    def create_texts

        @instagram_text_create = InstagramText.new(instagram_text_params)
        puts @instagram_text_create
        @instagram_text_create.save
        redirect_to @instagram_text_create

    end

    def update

        @instagram_update = InstagramPost.find(params[:id])

        @instagram_update.update(instagram_params)
        redirect_to @instagram_update

    end

    def update_video

        @instagram_update_video = InstagramVideo.find(params[:id])

        @instagram_update_video.update(instagram_video_params)
        redirect_to @instagram_update_video

    end

    def update_text
        @instagram_update_text = InstagramText.find(params[:id])

        @instagram_update_text.update(instagram_text_params)
        redirect_to @instagram_update_text
    end

    def destroy

        @instagram_delete = InstagramPost.find(params[:id])
        @instagram_delete.destroy

        redirect_to root_path

    end

    def destroy_video

        @instagram_video_delete = InstagramVideo.find(params[:id])
        @instagram_video_delete.destroy

        redirect_to root_path

    end

    def destroy_text
        @instagram_text_delete = InstagramText.find(params[:id])
        @instagram_text_delete.destroy

        redirect_to root_path
    end


    private
      def instagram_params
        params.require(:instagrams).permit(:name, :image_url, :caption)
      end

      def instagram_video_params
        params.require(:instagram_videos).permit(:name, :video_key, :title, :caption)
      end

      def instagram_text_params
        params.require(:instagram_texts).permit(:name, :title, :text)
      end


end