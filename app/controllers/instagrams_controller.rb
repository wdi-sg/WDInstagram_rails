class InstagramsController < ApplicationController

    def index
        @instagram_all = Instagram.all
    end

    def show
        @instagram_indiv = Instagram.find(params[:id])
    end

    def new
    end

    def edit

        @instagram_edit = Instagram.find(params[:id])

    end

    def create

        @instagram_create = Instagram.new(instagram_params)

        @instagram_create.save
        redirect_to @instagram_create
        # render plain: params[:instagram].inspect

    end

    def update
        @instagram_update = Instagram.find(params[:id])

        @instagram_update.update(instagram_params)
        redirect_to @instagram_update
    end

    def destroy
        @instagram_delete = Instagram.find(params[:id])
        @instagram_delete.destroy

        redirect_to root_path
    end


    private
      def instagram_params
        params.require(:instagram).permit(:name, :photo_url, :title, :caption)
      end

end