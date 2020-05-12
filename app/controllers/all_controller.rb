class AllController < ApplicationController
  def index
    @posts = Post.all
    @videos = Video.all
    @results = {
      post: @posts,
      video: @videos
    }
  end
end
