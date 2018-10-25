class HashtagsController < ApplicationController
    def index
      @hashtags = Hashtag.all
    end

    def create
        #render plain: params.inspect
        @hashtag = Hashtag.new(hashtag_params)
        @hashtag.save
        redirect_to entries_path
    end

    def show
      @hashtag = Hashtag.find(params[:id])
      @entries = @hashtag.entries
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
        params.require(:hashtag).permit(:id, :text, :entry_ids => [])
      end
end
