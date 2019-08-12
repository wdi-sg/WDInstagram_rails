class PostsController < ApplicationController

  def index
    # get the list of articles
    @posts = Post.all()
    # puts "+++++++++++++++++++++++++++++++++++++++"
    # puts "contents of @articles variable:"
    # p @articles.inspect
  end

  def new
  end

  def create
    @post = Post.new(post_params)

    @post.save()
    redirect_to @post

    # puts "CREATE INSTANCE OF MODEL CLASS"
    # @post = Post.new(post_params)
    #article_params defined in line 60 as new form
    # puts "DO INSERT"
    # @post.save()
    # puts "now send stuff back"

    # redirect_to @post #which refers to a row in the db

    #redirect_to '/article/3'
    #redirect_to '/article/'+@article.id
    #redirect_to 'https://www.google.com'
    #redirects to '/articles/:id'

    # render plain: params[:article].inspect
    # render plain: "WE GOT IT"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    @post.update(post_params)

    redirect_to @post



  #   # render plain: params[:article].inspect
  end

  def show
    @banana = Post.find(params[:id])
    # @banana = Article.find(1)
    # @something = "8888889 wow"
  end



  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end


  private
  def post_params
    params.require(:post).permit(:title, :author_name, :photo_url, :mediatype, :caption)
  end

end