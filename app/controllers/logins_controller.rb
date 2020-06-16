# frozen_string_literal: true

class LoginsController < ApplicationController
  # "Create" a login, aka "log the user in"
  def new
    @user = User.new
  end

  def create
    if user = User.authenticate(params[:username], params[:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
      redirect_to root_url
    end
  end

  def destroy
    # Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
  end
end
