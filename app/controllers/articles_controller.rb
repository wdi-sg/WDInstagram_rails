class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
  
    def show
        @article = Article.find(params[:id])
    end
  
    def new
        
    end
  
    def edit

    end
  
    def create
        render plain: params[:article].inspect
    end
  
    def update

    end
  
    def destroy

    end

    private
    def article_params

    end
  end