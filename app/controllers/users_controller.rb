class UsersController < ApplicationController
  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(user_attributes)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  private

  def user_attributes
    params.require(:user).permit(:email, :password, :password_confirmation, {profile_attributes: [:first_name, :last_name, :linkedin, :twitter]})   
  end

end
