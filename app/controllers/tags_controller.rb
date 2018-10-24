class TagsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])

    if Tag.where(tag_params).exists?
      @tag = Tag.where(tag_params)
      if @post.tags.exists?(@tag) == false
        @post.tags << @tag
        @post.save
      end
    else
      puts false
      @tag = Tag.new(tag_params)
      @tag.save

      @post.tags << @tag
      @post.save
    end

    redirect_to @post
  end

  private

  def tag_params
    params.require(:tag).permit(:tag)
  end

end