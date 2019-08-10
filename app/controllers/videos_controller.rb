class VideosController < ApplicationController
    layout "headbar"
    def new
        @video = Video.new
    end

    def create
        @video = Video.new(video_params)

        if @video.save
            redirect_to @video
        else
            render 'new'
        end

    end

    def show
        @video = Video.find(params[:id])
    end

    def edit
        @video = Video.find(params[:id])
    end

    def update
        @video = Video.find(params[:id])

        if @video.update(video_params)
            redirect_to @video
        else
            render 'edit'
        end
    end

    def destroy
        @video = Video.find(params[:id])
        @video.destroy

        redirect_to root_path
    end
end

private
  def video_params
    params.require(:video).permit(:author_name, :video_url,:title,:caption)
  end



private
    def timeConverted(time)
        currentTime = Time.now

        timeAgo = currentTime - time.in_time_zone('Singapore')

        seconds = timeAgo.floor
        minute = (seconds / 60).floor
        seconds = seconds % 60
        hour = (minute / 60).floor
        minute = minute % 60
        day = (hour / 24).floor
        hour = hour % 24

        if day > 0
            puts "#{time.strftime("%d")} #{time.strftime("%b")}"
            return "#{time.strftime("%d")} #{time.strftime("%b")}"
        else
            if hour > 0
                return "#{hour} hours ago"
            else
                return "#{minute} mins ago"
            end
        end
    end
