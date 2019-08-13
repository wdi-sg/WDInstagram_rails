class ArticlesController < ApplicationController

   def index
     @article = article.all
   end

   def show
     @article = article.find(params[:id])
   end

   def new
   end

   def edit
     @article = article.find(params[:id])
   end

   def create
     @article = article.new(article_params)
     @article.save
     redirect_to @article
   end

   def update
     @article = article.find(params[:id])
     @article.update(article_params)
     redirect_to @article
   end

   def destroy
     @article = article.find(params[:id])
     @article.destroy
     redirect_to root_path
   end

   #private
   def article_params
     params.require(:article).permit(:author, :photo_url, :title)
   end

 end