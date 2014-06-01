class ProfilesController < ApplicationController
  
  before_action :find_profile

  def show
    
  end

  def update
    if @profile.update_attributes(profile_params)
      redirect_to posts_path
    end
  end

  def edit
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :linkedin, :twitter)
  end

  def find_profile
    @profile = current_user.profile
  end

end