class InstagramsController < ApplicationController

    def index
        @instagram_all = Instagram.all
        @instagram_video_all = InstagramVideo.all
    end

    def show
        @instagram_indiv = Instagram.find(params[:id])

    end

    def show_video

      @instagram_indiv_video = InstagramVideo.find(params[:id])

    end

    def new
    end

    def new_videos
    end

    def edit

        @instagram_edit = Instagram.find(params[:id])

    end

    def edit_video

        @instagram_edit_video = InstagramVideo.find(params[:id])

    end

    def create

        @instagram_create = Instagram.new(instagram_params)

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

    def update

        @instagram_update = Instagram.find(params[:id])

        @instagram_update.update(instagram_params)
        redirect_to @instagram_update

    end

    def update_video

        @instagram_update_video= InstagramVideo.find(params[:id])

        @instagram_update_video.update(instagram_video_params)
        redirect_to @instagram_update_video

    end

    def destroy

        @instagram_delete = Instagram.find(params[:id])
        @instagram_delete.destroy

        redirect_to root_path

    end

    def destroy_video

        @instagram_video_delete = InstagramVideo.find(params[:id])
        @instagram_video_delete.destroy

        redirect_to root_path

    end


    private
      def instagram_params
        params.require(:instagrams).permit(:name, :image_url, :caption)
      end

      def instagram_video_params
        params.require(:instagram_videos).permit(:name, :video_key, :title, :caption)
      end


end