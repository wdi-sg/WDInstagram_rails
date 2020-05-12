class SortsController < ApplicationController
  def sortpost
    puts params
    puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    puts request.method
    puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

    if request.query_string == 1.to_s
      @result = Post.all.order('created_at ASC')
    elsif request.query_string == 2.to_s
      @result = Post.all.order('created_at DESC')
    end
    puts '~~~~~~~~~~~~~~~~~~~~~~~~'

    render json: @result
  end

  def sortvideo
    puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    puts request.query_string
    puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

    if request.query_string == 1.to_s
      @result = Video.all.order('created_at ASC')
    elsif request.query_string == 2.to_s
      @result = Video.all.order('created_at DESC')
    end
    puts '~~~~~~~~~~~~~~~~~~~~~~~~'

    render json: @result
  end

  def sortall
    puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    puts request.query_string
    puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    if request.query_string == 1.to_s
      @posts = Post.all.order('created_at ASC')
      @videos = Video.all.order('created_at ASC')
    elsif request.query_string == 2.to_s
      @posts = Post.all.order('created_at DESC')
      @videos = Video.all.order('created_at DESC')
    end
    puts '~~~~~~~~~~~~~~~~~~~~~~~~'
    @result = {
      posts: @posts,
      videos: @videos,
      sortstring: request.query_string
    }
    render json: @result
  end

end
