class PagesController < ApplicationController

  def about
    @title = 'About Us'
    @content = 'This is about page'
  end

end
