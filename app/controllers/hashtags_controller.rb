class HashtagsController < ApplicationController
    def index
      @hashtags = Hashtag.all
    end

    def create
        @hashtag = Hashtag.new(hashtag_params)
        @hashtag.save
        redirect_to entries_path
    end

    def show
    end

    def new
    end

    def edit

    end

    def update

    end

    def destroy

    end


    private
      def hashtag_params
        params.require(:hashtag).permit(:text, :entry_id => [])
      end
end
