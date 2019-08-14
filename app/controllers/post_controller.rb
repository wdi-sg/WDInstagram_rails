class PostController < ApplicationController
    def index
    # get the list of posts
    @post = Post.all()
    # puts "+++++++++++++++++++++++++++++++++++++++"
    # puts "contents of @posts variable:"
    # p @posts.inspect
  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    @post.update(post_params)

    redirect_to @post



    # render plain: params[:post].inspect
  end

  def show
    @banana = Post.find(params[:id])
    # @banana = Post.find(1)
    @something = "8888889 wow"
  end

  def create

    puts "CREATE INSTANCE OF MODEL CLASS"
    @post = Post.new(post_params)
    puts "DO INSERT"
    @post.save()
    puts "now send stuff back"

    redirect_to @post
    # render plain: params[:post].inspect

    # render plain: "WE GOT IT"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end


  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
