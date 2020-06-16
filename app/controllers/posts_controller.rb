#started with "rails generate controller Posts", that generated this file
#here we add methods for every RESTful route action
#after this file was generated,
# created @posts in the posts's controller Index action
#later the index.html.erb file will loop through @posts array to display every @post from the database

class PostsController < ApplicationController

  def index
    @posts = Post.all
    #post.all or posts.all?
  end

   def show
     @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post= Post.find(params[:id])
  end

  def create

  #render plain: params[:post].inspect

  @post = Post.new(post_params)

    @post.save
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

   private

  def post_params
    params.require(:post).permit(:title, :author_name, :photo_url)
  end

end