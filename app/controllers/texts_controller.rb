class TextsController < ApplicationController

    def all
        @texts = Text.all
        render:index
    end

    def show
        @text = Text.find(params[:id])
    end

    def sort
        @texts = Text.all
        conds = params[:conds]
        order = params[:order]
        if order == "asc"
            @texts = @texts.sort_by {|a| a[conds]}
        else
            @texts = @texts.sort_by {|a| a[conds]}.reverse
        end
        render :index
    end

    def new
    end

    def edit
        @text = Text.find(params[:id])
    end

    def create
        @text = Text.new(text_params)
        @text.save
        redirect_to @text
    end

    def update
        @text = Text.find(params[:id])
        @text.update(text_params)
        redirect_to @text
    end

    def destroy
        @text = Text.find(params[:id])
        @text.destroy

        redirect_to root_path
    end

    private
        def text_params
            params.require(:text).permit(:author_name, :text_msg, :title, :caption)
        end

end
