class VideosController < ApplicationController

    def all
        @videos = Video.all
        render :index
    end

    def show
        @video = Video.find(params[:id])
        puts "$$$$$$$$$$$$$$$$$$$$$$$$$"
    end

    def sort
        @videos = Video.all
        @conds = params[:conds]
        @order = params[:order]
        puts @conds
        puts @order
        if @order == "asc"
            @videos = @videos.sort_by {|a| a[@conds]}
        else
            @videos = @videos.sort_by {|a| a[@conds]}.reverse
        end
        render :index
    end

    def new
    end

    def edit
        @video = Video.find(params[:id])
    end

    def create
        puts "@@@@@@ creating new record @@@@@@"
        @video = Video.new(post_params)

        @video.save
        redirect_to @video
    end

    def update
        @video = Video.find(params[:id])
        @video.update(post_params)
        redirect_to @video
    end

    def destroy
        @video = Video.find(params[:id])
        @video.destroy

        redirect_to root_path
    end

    private
        def post_params
            params.require(:video).permit(:author_name, :video_url, :title, :caption)
        end

end
