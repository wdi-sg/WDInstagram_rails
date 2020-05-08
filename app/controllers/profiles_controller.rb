class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
  end

  def create
    @profile = Profile.new(profile_params)

    @profile.save
    redirect_to @profile
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

private
  def profile_params
    params.require(:profile).permit(:author_name, :photo_url, :title)
  end