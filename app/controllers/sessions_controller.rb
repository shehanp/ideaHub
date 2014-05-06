class SessionsController < ApplicationController
  
  def create
    user = User.find_by_email(params[:email])
    respond_to do |format|
      if user && user.authenticate(params[:password])
        if params[:remember_me]
          cookies.permanent[:auth_token] = user.auth_token
        else
          cookies[:auth_token] = user.auth_token
        end
        format.html { redirect_to root_path, notice: "You're logged in!" }
        format.js do
          flash.now.notice = "You're signed in!"
          render
        end
      else
        flash.now.alert = "Email or password is invalid"
        format.html { render :new }
        format.js { render :new }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end

  # def create
  #   user = User.find_by_email(params[:email])
  #   if user && user.authenticate(params[:password])
  #     if params[:remember_me]
  #       cookies.permanent[:auth_token] = user.auth_token
  #     else
  #       cookies[:auth_token] = user.auth_token  
  #     end
  #     redirect_to root_url, :notice => "Logged in!"
  #   else
  #     flash.now.alert = "Invalid email or password"
  #     render :new
  #   end
  # end  
