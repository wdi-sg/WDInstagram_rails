class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @tags = Tag.all
    @comments = Comment.where(post_id: params[:id])
  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end


  def create

    @post = Post.new(post_params)
    @post.user = current_user

    if @post.caption

      newtags = @post.caption.split(" ")
      newtags.each do |tagcontent|

        if Tag.where(content: tagcontent).empty?  # Tag does not exist yet, will create
          newtag = Tag.new(content: tagcontent)
          newtag.save
          @post.tags << newtag

        else  # Found existing tag, will use existing
          @post.tags << Tag.where(content: tagcontent)[0]

        end
      end
    end

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end


  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:author, :photo_url, :caption, :date_taken, :tag_ids => [])
  end

end







