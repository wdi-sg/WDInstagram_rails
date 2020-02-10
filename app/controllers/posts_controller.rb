require "net/http"
require "json"

class PostsController < ApplicationController
  def index
    puts params
    sort = params[:sort]
    order = params[:order]
    if sort == "date" && order == "desc"
      @posts = Post.all.order("updated_at desc")
    elsif sort == "date" && order == "asc"
      @posts = Post.all.order("updated_at asc")
    else
      @posts = Post.all
    end
    # render plain: "Hello"
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    url = "http://api.giphy.com/v1/gifs/search?q=wwe&api_key=dc6zaTOxFJmzC&limit=1"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
    puts "Hello"
    puts result[1]
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    foo = post_params
    puts foo.inspect
    @post = Post.new(post_params)

    @post.save
    # redirect_to ("/")
    redirect_to @post
  end

  def update
    @post = Post.find(params[:id])

    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end
end

private

def post_params
  params.require(:post).permit(:title, :author_name, :photo_url, :caption)
end
