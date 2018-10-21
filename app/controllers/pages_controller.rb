class PagesController < ApplicationController
  def about
    @title = 'About Us'
    @content = 'My About page'
  end
end
