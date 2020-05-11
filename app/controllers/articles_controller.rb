class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @articles = Article.order('created_at DESC')
    #Article.select("created_at")
    # Article.find_by created_at:
    # render :json => @articles
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def edit
    @article = Article.find(params[:id])
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

#   def api_gif

#     api_instance = GiphyClient::DefaultApi.new

#     api_key = "dc6zaTOxFJmzC" # String | Giphy API Key.

#     q = "cheeseburgers" # String | Search query term or prhase.

#     opts = {
#       limit: 25, # Integer | The maximum number of records to return.
#       offset: 0, # Integer | An optional results offset. Defaults to 0.
#       rating: "g", # String | Filters results by specified rating.
#       lang: "en", # String | Specify default country for regional content; use a 2-letter ISO 639-1 country code. See list of supported languages <a href = \"../language-support\">here</a>.
#       fmt: "json" # String | Used to indicate the expected response format. Default is Json.
#     }

#     begin
#       #Search Endpoint
#       result = api_instance.gifs_search_get(api_key, q, opts)
#       p result
#     rescue GiphyClient::ApiError => e
#       render "Exception when calling DefaultApi->gifs_search_get: #{e}"
#     end
#   end
end

private
  def article_params
    params.require(:article).permit(:author_name, :photo_url, :title, :caption)
  end