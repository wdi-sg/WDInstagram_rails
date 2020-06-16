# frozen_string_literal: true

class RegistersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @register
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
