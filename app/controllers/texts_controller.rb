class TextsController < ApplicationController
    layout "headbar"
    def new
        @text = Text.new
    end

    def create
        @text = Text.new(text_params)

        if @text.save
            redirect_to @text
        else
            render 'new'
        end

    end

    def show
        @text = Text.find(params[:id])
    end

    def edit
        @text = Text.find(params[:id])
    end

    def update
        @text = Text.find(params[:id])

        if @text.update(text_params)
            redirect_to @text
        else
            render 'edit'
        end
    end

    def destroy
        @text = Text.find(params[:id])
        @text.destroy

        redirect_to root_path
    end
end

private
  def text_params
    params.require(:text).permit(:author_name, :text)
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

