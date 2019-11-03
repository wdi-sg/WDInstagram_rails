#started with "rails generate controller Posts", that generated this file
#here we add methods for every RESTful route action
#after this file was generated,
# created @posts in the posts's controller Index action
#later the index.html.erb file will loop through @posts array to display every @post from the database

class PostsController < ApplicationController

  def index
    @posts = Posts.all
  end

   def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end