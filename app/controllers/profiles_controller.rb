class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
    puts request.query_parameters
    order = request.query_parameters['order']
    type = request.query_parameters['type']
    case type
    when "date"
      @profiles = @profiles.order(:created_at)
      if order == "asc"
        @profiles = @profiles.reverse
      end
    end

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
     @profile = Profile.find(params[:id])
  end

  def update
      @profile = Profile.find(params[:id])

      @profile.update(profile_params)
      redirect_to @profile
  end

  def destroy
      @profile = Profile.find(params[:id])
      @profile.destroy

      redirect_to root_path
  end


#  def sort
 #   render("Hello world");
 # end
end


private
  def profile_params
    params.require(:profile).permit(:author_name, :photo_url, :title, :caption)
  end