require 'GiphyClient'
require 'json'

class ArticlesController < ApplicationController

  def index
      @results = [];

      Article.all.each do |post|
        @results.push(post)
      end

    if params[:order] === nil || params[:sort] == "date" && params[:order] =="des"
      puts "hello #{params}"
      puts @results
      @results = @results.sort_by {|result| result[:created_at]}.reverse
    elsif params[:sort] == "date" && params[:order] =="asc"
      @results
    end

  end

  def show
    @article = Article.find(params[:id])

  end

  def new
    begin
      api_instance = GiphyClient::DefaultApi.new
      api_key = "UTAiBBivgvVDoEVhGDIN3FKIRl7AacmU" # String | Giphy API Key.

      opts = {
        # tag: "burrito", # String | Filters results by specified tag.
        # rating: "g", # String | Filters results by specified rating.
        limit: 25,
        # fmt: "json" # String | Used to indicate the expected response format. Default is Json.
      }

      # start API call
      begin
    #Categories Endpoint.
        @result = api_instance.gifs_categories_get(api_key, opts)

        # random GIF
        randomNumber = rand(1..25)
        @test = @result.data[randomNumber].gif.images.fixed_height.url
      # end of api call
      rescue GiphyClient::ApiError => e
        puts "Exception when calling DefaultApi->gifs_categories_get: #{e}"
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    render plain: params[:article].inspect
  end

  def create
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  def update
    @article = Article.find(params[:id])

    @article.update(article_params)
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  def sort
    puts "hello"
  end

  # RAILS SECURITY FEATURE?
  private
  def article_params
    params.require(:article).permit(:author_name, :title, :photo_url, :caption)
  end
end