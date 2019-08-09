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
    end

    def create

        @instagram = Instagram.new(instagram_params)

        @instagram.save
        redirect_to @instagram
        # render plain: params[:instagram].inspect

    end

    def update
    end

    def destroy
    end


    private
      def instagram_params
        params.require(:instagram).permit(:name, :photo_url, :title, :caption)
      end

end