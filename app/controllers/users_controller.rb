class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_attributes)
    respond_to do |format|
      if @user.save && user.authenticate(params[:password])
        session[:user_id] = user.id
        format.html   {redirect_to root_path, notice: "Thank you for signing up!"}
        format.js     {render }    
      else
        flash.now.alert = "Invalid email or password"
        format.html   {render :new}
        format.js     {render :new}
      end
    end
  end

  private

  def user_attributes
    params.require(:user).permit([:email, :password])   
  end

end
