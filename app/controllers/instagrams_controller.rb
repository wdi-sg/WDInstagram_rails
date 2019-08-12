class InstagramsController < ApplicationController

    def index
        # @instagram_all = InstagramPost.all
        # @instagram_all = @instagram_all.reverse
        # @instagram_video_all = InstagramVideo.all
        # @instagram_video_all = @instagram_video_all.reverse
        # @instagram_text_all = InstagramText.all
        # @instagram_text_all = @instagram_text_all.reverse
        @instagram = Instagram.all
        @instagram = @instagram.reverse
    end

    def show_post

        @instagram_indiv = Instagram.find(params[:id])

    end

    def show_video

      @instagram_indiv_video = Instagram.find(params[:id])

    end

    def show_text

      @instagram_indiv_text = Instagram.find(params[:id])

    end

    def new_posts
    end

    def new_videos
    end

    def new_texts
    end

    def edit
        @instagram_edit = Instagram.find(params[:id])
        # render plain: @instagram_edit_posts.inspect
    end

    def edit_video

        @instagram_edit_video = Instagram.find(params[:id])

    end

    def edit_text
        @instagram_edit_text = Instagram.find(params[:id])
    end

    def create_posts

        # render plain: params[:instagram_posts].inspect
        @instagram_create = Instagram.new(instagram_post_params)

        @instagram_create.save
        redirect_to '/instagrams/posts/'+ @instagram_create[:id].to_s

    end

    def create_videos

        # render plain: params[:instagram_video].inspect

        @instagram_video_create = Instagram.new(instagram_video_params)
        # puts @instagram_video_create
        @instagram_video_create.save
        redirect_to '/instagrams/videos/'+ @instagram_video_create[:id].to_s

    end

    def create_texts

        @instagram_text_create = Instagram.new(instagram_text_params)
        puts @instagram_text_create
        @instagram_text_create.save
        redirect_to '/instagrams/texts/'+ @instagram_text_create[:id].to_s

    end

    def update

        @instagram_update = Instagram.find(params[:id])

        @instagram_update.update(instagram_params)
        redirect_to @instagram_update

    end

    def update_video

        @instagram_update_video = Instagram.find(params[:id])

        @instagram_update_video.update(instagram_video_params)
        redirect_to @instagram_update_video

    end

    def update_text
        @instagram_update_text = Instagram.find(params[:id])

        @instagram_update_text.update(instagram_text_params)
        redirect_to @instagram_update_text
    end

    def destroy

        @instagram_delete = Instagram.find(params[:id])
        @instagram_delete.destroy

        redirect_to root_path

    end

    def destroy_video

        @instagram_video_delete = Instagram.find(params[:id])
        @instagram_video_delete.destroy

        redirect_to root_path

    end

    def destroy_text
        @instagram_text_delete = Instagram.find(params[:id])
        @instagram_text_delete.destroy

        redirect_to root_path
    end


    private
      def instagram_post_params
        params.require(:instagram_posts).permit(:name, :category, :image_url, :title, :caption)
      end

      def instagram_video_params
        params.require(:instagram_videos).permit(:name, :category, :video_key, :title, :caption)
      end

      def instagram_text_params
        params.require(:instagram_texts).permit(:name, :category, :title, :caption)
      end


end