require 'GiphyClient'


class PostsController < ApplicationController

def index

if params[:sort_type] == "date_asc"
    @posts = Post.order(updated_at: :desc)

elsif params[:sort_type] == "date_desc"
    @posts = Post.order(updated_at: :asc)

else
    @posts = Post.order(id: :desc)
end

end


def relative_time(start_time)
  diff_seconds = Time.now - start_time
  case diff_seconds
    when 0 .. 59
      puts "#{diff_seconds} seconds ago"
    when 60 .. (3600-1)
      puts "#{diff_seconds/60} minutes ago"
    when 3600 .. (3600*24-1)
      puts "#{diff_seconds/3600} hours ago"
    when (3600*24) .. (3600*24*30)
      puts "#{diff_seconds/(3600*24)} days ago"
    else
      puts start_time.strftime("%m/%d/%Y")
  end
end

def new
end

#show individual post
def show
    @post = Post.find(params[:id])
    # render plain: params[:post].inspect
end

#create individual post
def create
    @post = Post.new(post_params)

    if(params[:gifCheck] == "true")
        gifImageUrl = Giphy()
        @post.photo_url = gifImageUrl.data.image_url
    end

     if @post.save
        redirect_to @post
    else
        render 'new'
    end


    # @post.save
    # redirect_to @post
    # render plain: params[:post].inspect
    # render plain: "WE GOT IT"
end

def edit
    @post = Post.find(params[:id])
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
#########################################################################################
private
    def Giphy
    # load the gem

    api_instance = GiphyClient::DefaultApi.new

        api_key = "dc6zaTOxFJmzC" # String | Giphy API Key.

        opts = {
          fmt: "json" # String | Used to indicate the expected response format. Default is Json.
        }

        begin
          #Random Endpoint
          result = api_instance.gifs_random_get(api_key, opts)

        rescue GiphyClient::ApiError => e
          puts "Exception when calling DefaultApi->gifs_random_get: #{e}"
        end

end
#########################################################################################


private
def post_params
    params.require(:post).permit(:title, :author_name, :photo_url, :caption)
end


end
